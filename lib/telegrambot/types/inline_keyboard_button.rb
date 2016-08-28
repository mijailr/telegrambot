module Telegrambot::Types
  class InlineKeyboardButton < Base
    attribute :text, String
    attribute :url, String
    attribute :callback_data, String
    attribute :switch_inline_query, String
  end
end
