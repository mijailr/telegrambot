module Telegrambot::Type
  class InlineQueryResultAudio < Base
    attribute :type, String, default: 'audio'
    attribute :id, String
    attribute :audio_url, String
    attribute :title, String
    attribute :performer, String
    attribute :audio_duration, Integer
    attribute :reply_markup, InlineKeyboardMarkup
    attribute :input_message_content, InputMessageContent
  end
end
