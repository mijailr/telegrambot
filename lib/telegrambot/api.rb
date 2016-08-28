module Telegrambot
  class Api

    attr_reader :token

    REPLY_MARKUP_TYPES = [
        Telegrambot::Types::ReplyKeyboardMarkup,
        Telegrambot::Types::ReplyKeyboardHide,
        Telegrambot::Types::ForceReply,
        Telegrambot::Types::InlineKeyboardMarkup
    ].freeze

    # INLINE_QUERY_RESULT_TYPES = [
    #     Telegrambot::Types::InlineQueryResultArticle,
    #     Telegrambot::Types::InlineQueryResultPhoto,
    #     Telegrambot::Types::InlineQueryResultGif,
    #     Telegrambot::Types::InlineQueryResultMpeg4Gif,
    #     Telegrambot::Types::InlineQueryResultVideo,
    #     Telegrambot::Types::InlineQueryResultAudio,
    #     Telegrambot::Types::InlineQueryResultVoice,
    #     Telegrambot::Types::InlineQueryResultDocument,
    #     Telegrambot::Types::InlineQueryResultLocation,
    #     Telegrambot::Types::InlineQueryResultVenue,
    #     Telegrambot::Types::InlineQueryResultContact,
    #     Telegrambot::Types::InlineQueryResultCachedPhoto,
    #     Telegrambot::Types::InlineQueryResultCachedGif,
    #     Telegrambot::Types::InlineQueryResultCachedMpeg4Gif,
    #     Telegrambot::Types::InlineQueryResultCachedSticker,
    #     Telegrambot::Types::InlineQueryResultCachedDocument,
    #     Telegrambot::Types::InlineQueryResultCachedVideo,
    #     Telegrambot::Types::InlineQueryResultCachedVoice,
    #     Telegrambot::Types::InlineQueryResultCachedAudio
    # ].freeze

    def initialize(token)
      @token = token
    end

    private_instance_methods :snakecase
    def self.snakecase(endpoint)
      endpoint.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end

    %w(
        getUpdates setWebhook getMe sendMessage forwardMessage sendPhoto
        sendAudio sendDocument sendSticker sendVideo sendVoice sendLocation
        sendVenue sendContact sendChatAction getUserProfilePhotos getFile
        kickChatMember unbanChatMember answerCallbackQuery editMessageText
        editMessageCaption editMessageReplyMarkup answerInlineQuery getChat
        leaveChat getChatAdministrators getChatMember getChatMembersCount
    ).map{ |e| snakecase(e) }.each do | endpoint |
      define_method endpoint do | raw_params = {} |
        params = build_params(raw_params)
        response = rest_client.post("/bot#{token}/#{camelcase(endpoint)}", params)
        raise Telegrambot::Exceptions::ResponseError.new(response) unless response.status == 200
        JSON.parse(response.body)
      end
    end

    private

    def camelcase(endpoint)
      words = endpoint.split('_')
      words.drop(1).map(&:capitalize!)
      words.join
    end

    def build_params(hash)
      hash.each_with_object({}) do |(key, value), params|
        params[key] = sanitize_value(value)
      end
    end

    def sanitize_value(value)
      json_inline_query_results(json_reply_markup(value))
    end

    def json_reply_markup(value)
      return value unless REPLY_MARKUP_TYPES.include?(value.class)
      value.to_compact_hash.to_json
    end

    def json_inline_query_results(value)
      return value unless value.is_a?(Array) && value.all? { |i| INLINE_QUERY_RESULT_TYPES.include?(i.class) }
      value.map { |i| i.to_compact_hash.select { |_, v| v } }.to_json
    end

    def rest_client
      Faraday.new(url: 'https://api.telegram.org') do |faraday|
          faraday.request :multipart
          faraday.request :url_encoded
          faraday.adapter Faraday.default_adapter
        end
    end

  end
end
