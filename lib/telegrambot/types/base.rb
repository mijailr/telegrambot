module Telegrambot::Types
  class Base
    include Virtus.model
    
    # @return [Hash]
    def to_compact_hash
      Hash[attributes.dup.delete_if { |_, v| v.nil? }.map do |key, value|
            value =
              if value.class.ancestors.include?(Telegrambot::Types::Base)
                value.to_compact_hash
              else
                value
              end
            [key, value]
      end]
    end
  end
end
