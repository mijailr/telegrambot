module Telegrambot
  class Client
    attr_reader :api
    
    def initialize(token)
      @api = Api.new(token)
    end

    # Escucha Webhooks
    # @return [Telegrambot::Types::Update]
    # @param update [Hash]
    def listen_webhook(update)
      update = Telegrambot::Types::Update.new(data)
    end


  end
end
