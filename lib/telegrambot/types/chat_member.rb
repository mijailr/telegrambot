module Telegrambot::Types
  class ChatMember < Base
    attribute :user, User
    attribute :status, String
  end
end
