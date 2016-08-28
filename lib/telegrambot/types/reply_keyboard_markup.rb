module Telegrambot::Types
  class ReplyKeyboardMarkup < Base
    attribute :keyboard, Array[Array[KeyboardButton]]
    attribute :resize_keyboard, Boolean
    attribute :one_time_keyboard, Boolean
    attribute :selective, Boolean
  end
end
