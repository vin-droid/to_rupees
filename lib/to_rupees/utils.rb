# frozen_string_literal: true
require_relative "./under_hundred.rb"
module ToRupees
  module Utils
    include UnderHundred

    def result_below_one_thousand(num, counter)
      hundred, remaining = num.divmod(100)

      return higher_than_hundred(hundred, remaining, counter) if hundred != 0
      UNDER_HUNDRED[remaining] if hundred == 0 && remaining != 0
    end

    def higher_than_hundred(hundred, remaining, counter)
      century = UNDER_HUNDRED[hundred]
      if remaining != 0
        return century + " hundred " + UNDER_HUNDRED[remaining] if counter != 0
        return century + " hundred and " + UNDER_HUNDRED[remaining]
      end
      return century + " hundred " if remaining == 0
    end

    def numerical?(num)
      Integer(num)
    rescue
      raise "A numeric is expected"
    end
  end
end
