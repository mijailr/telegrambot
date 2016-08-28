module Telegrambot::Type
  class InlineQuery < Base
    attribute :id, String
    attribute :from, User
    attribute :location, Location
    attribute :query, String
    attribute :offset, String
  end
end
