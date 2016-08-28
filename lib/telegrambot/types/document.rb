module Telegrambot::Types
  class Document < Base
    attribute :file_id, String
    attribute :thumb, PhotoSize
    attribute :file_name, String
    attribute :mime_type, String
    attribute :file_size, Integer
  end
end
