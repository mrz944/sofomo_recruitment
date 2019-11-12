module IPStack
  class Error < StandardError
    def self.from_code(code)
      case code.to_i
      when 101
        IPStack::InvalidApiKey
      when 104
        IPStack::UsageLimitReached
      else
        IPStack::InavalidResponse
      end
    end
  end

  class InvalidApiKey < Error; end
  class UsageLimitReached < Error; end
  class InavalidResponse < Error; end
end
