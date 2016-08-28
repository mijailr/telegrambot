module Telegrambot::Types
  class CallbackQuery < Base
    attribute :id, String
    attribute :from, User
    attribute :message, Message
    attribute :inline_message_id, String
    attribute :data, String
  end
end
