module Telegrambot::Types
  class UserProfilePhotos < Base
    attribute :total_count, Integer
    attribute :photos, Array[Array[PhotoSize]]
  end
end
