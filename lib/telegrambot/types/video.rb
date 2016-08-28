module Telegrambot::Types
  class Video < Base

    
     of the Telegrambot::Types::Video
    attribute :file_id, String
		
    attribute :width, Integer
		
    attribute :height, Integer
		
    attribute :duration, Integer
		
    attribute :thumb, PhotoSize
		
    attribute :mime_type, String
		
    attribute :file_size, Integer
  end
end
