require "./to_rupees/version.rb"
require "active_support/inflector"

module ToRupees
  require_relative "./to_rupees/under_hundred.rb"
  require_relative "./to_rupees/divisions.rb"
  require_relative "./to_rupees/utils.rb"

  include ToRupees::UnderHundred
  include ToRupees::Divisions
  include ToRupees::Utils
  class Error < StandardError; end

    def to_rupees
      num = numerical?(self)
      in_words = ''
      if num <= 100
        in_words = UNDER_HUNDRED[num]
      else
        counter  = 0
        result   = []
        num, remaining = num.divmod(1000)
        temp_result    = result_below_one_thousand(remaining, counter)
        result << temp_result + " " + DIVISIONS[counter] + " " if temp_result
        counter += 1
        while num != 0
          num, remaining = num.divmod(100)
          temp_result = result_below_one_thousand(remaining, counter)
          result << temp_result + " " + DIVISIONS[counter] + " " if temp_result
          counter += 1
        end
        in_words = result.reverse.join(", ").rstrip
      end
      (in_words + " rupee#{numerical?(self) > 1 ? 's' : ''}").titleize
    end

    INTEGER_KLASS = 1.class # Fixnum before Ruby 2.4, Integer from Ruby 2.4
	class INTEGER_KLASS
	  include ToRupees
	end

	class ::String
	  def to_rupees
      Float(self).to_rupees
    rescue
      raise "A numeric is expected"
    end
	end

	class ::Float
	  def to_rupees
      in_words = []
      v = divmod 1
      in_words << v[0].to_i.to_rupees
      if v[1].to_f.nonzero?
        decimal_in_words = ToRupees::UnderHundred::UNDER_HUNDRED[("%.2f" % v[1].to_f).split('.').last.to_i] + " paisa"
        in_words = [in_words.last.to_s.gsub(' and ', ' ').split(' ').join(' ')] if in_words.size.nonzero?
        in_words << decimal_in_words
      end
      in_words.map(&:titleize).join(' and ')
    end
	end
end
