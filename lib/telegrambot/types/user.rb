module Telegrambot::Types
  class User < Base
    attribute :id, Integer
    attribute :first_name, String
    attribute :last_name, String
    attribute :user_name, String
  end
end
