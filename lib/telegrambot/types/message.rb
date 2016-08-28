module Telegrambot::Types
  class Message < Base
    attribute :message_id, Integer
    attribute :from, User
    attribute :date, Integer
    attribute :chat, Chat
    attribute :forward_from, User
    attribute :forward_from_chat, Chat
    attribute :forward_date, Integer
    attribute :reply_to_message, Message
    attribute :edit_date, Integer
    attribute :text, String
    attribute :entities, Array[MessageEntity]
    attribute :audio, Audio
    attribute :document, Document
    attribute :photo, Array[PhotoSize]
    attribute :sticker, Sticker
    attribute :video, Video
    attribute :voice, Voice
    attribute :caption, String
    attribute :venuw, Venue
    attribute :new_chat_member, User
    attribute :left_chat_member, User
    attribute :new_chat_title, String
    attribute :delete_chat_photo, Boolean
    attribute :group_chat_created, Boolean
    attribute :supergroup_chat_created, Boolean
    attribute :channel_chat_created, Boolean
    attribute :migrate_to_chat_id, Integer
    attribute :migrate_from_chat_id, Integer
    attribute :pinned_message, Message

    alias t_s text

    def command?
        entities.first.type == "bot_command"
    end

    def command
      if command?
        text.slice(entities.first.offset, entities.first.length)
      end
    end

    def arguments
      if command?
        text.gsub(command, '').strip
      end
    end
  end
end
