module Telegrambot::Types
  class Contact < Base
    attribute :phone_number, String
    attribute :first_name, String
    attribute :last_name, String
    attribute :user_id, Integer
  end
end
