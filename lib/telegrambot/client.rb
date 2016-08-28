module Telegrambot
  class Client
    attr_reader :api
    def initialize(token)
      @api = Api.new(token)
    end

    # Listen for webhook params
    def listen_webhook(data)
      update = Telegrambot::Types::Update.new(data)
    end

    def get_commands(update)
      if update.entities; end
    end


  end
end
