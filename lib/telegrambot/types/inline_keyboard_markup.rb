module Telegrambot::Types
  class InlineKeyboardMarkup < Base
    attribute :inline_keyboard, Array[Array[InlineKeyboardButton]]
    # @return [Hash]
    def to_compact_hash
      hsh = super
      hsh[:inline_keyboard].map! do |arr|
        arr.map do |item|
          item.is_a?(InlineKeyboardButton) ? item.to_compact_hash : item
        end
      end
      hsh
    end
  end
end
