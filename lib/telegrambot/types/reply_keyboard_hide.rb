module Telegrambot::Types
  class ReplyKeyboardHide < Base
    attribute :hide_keyboard, Boolean
    attribute :selective, Boolean
  end
end
