module Telegrambot::Types
  class Chat < Base
    attribute :id, Integer
    attribute :type, String
    attribute :title, String
    attribute :user_name, String
    attribute :first_name, String
    attribute :last_name, String
  end
end
