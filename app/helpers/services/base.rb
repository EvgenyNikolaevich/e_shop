# frozen_string_literal: true

module Services
  # Base Service
  class Base
    def self.call(params)
      new.call(params)
    end
  end
end
