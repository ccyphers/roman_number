base = File.expand_path(File.dirname(__FILE__))
require "#{base}/ruby_ext/nil"
require "#{base}/ruby_ext/numeric"
require "#{base}/ruby_ext/string"

class InvalidRomanNumberFormat < StandardError ; end

=begin
Roman numerals are based on seven symbols:

Symbol Value

I      1
V      5
X      10
L      50
C      100
D      500
M      1,000


Numbers are formed by combining symbols together and adding the values. 
For example, MMVI is 1000 + 1000 + 5 + 1 = 2006. Generally, symbols are 
placed in order of value, starting with the largest values. When smaller 
values precede larger values, the smaller values are subtracted from the 
larger values, and the result is added to the total. For example 
MCMXLIV = 1000 + (1000 − 100) + (50 − 10) + (5 − 1) = 1944.

The symbols "I", "X", "C", and "M" can be repeated three times 
in succession, but no more. (They may appear four times if the third 
and fourth are separated by a smaller value, such as XXXIX.) 
"D", "L", and "V" can never be repeated.
"I" can be subtracted from "V" and "X" only. 
"X" can be subtracted from "L" and "C" only. 
"C" can be subtracted from "D" and "M" only. 
"V", "L", and "D" can never be subtracted.
Only one small-value symbol may be subtracted from any large-value symbol.
A number written in [16]Arabic numerals can be broken into digits. For example, 1903 is composed of 1, 9, 0, and 3. To write the Roman numeral, each of the non-zero digits should be treated separately. Inthe above example, 1,000 = M, 900 = CM, and 3 = III. Therefore, 1903 = MCMIII.

(Source: Wikipedia ( [17]http://en.wikipedia.org/wiki/Roman_numerals)
=end


class RomanNumber
  attr_reader :valid, :str

  def self.to_i(str)
    roman_n = new(str)

    raise InvalidRomanNumberFormat unless roman_n.valid
    roman_n.sum
  end

  def initialize(str)
    @three_repeat = %w(I X C M)
    @no_repeat = %w(D L V)
    @subtraction_rules = {'I' => %w(V X),
                          'X' => %w(L C),
                          'C' => %w(D M)}

    @str = str.upcase
    @valid = valid?
    @numeric_map = { 'I' => 1,
                     'V' => 5,
                     'X' => 10,
                     'L' => 50,
                     'C' => 100,
                     'D' => 500,
                     'M' => 1000 }

  end

  def sum
    raise InvalidRomanNumberFormat unless valid
    sum = 0
    0.upto(str.length-1) do |index|
      c = str[index]
      if str[index+1] and @subtraction_rules[c].include?(str[index+1])
          sum -= @numeric_map[c]
      else
        sum += @numeric_map[c]
      end
    end
    sum
  end

  def valid_allowed_triples
    @three_repeat.each { |i|
      groups = str.split(i*3)
      groups.delete_at(0)
      groups.each { |group|
        return false unless @subtraction_rules[i].include?(group[0])
      }
    }
    true
  end

  def valid_allowed_singles
    @no_repeat.each { |i|
      return false if str.grep(/#{i}/).length > 1 
    }
    true
  end

  def valid_allowed_subtractions
    @subtraction_rules.each_pair { |k, v|
      index = str.rindex(k)
      if index and str.length > index+1
        return false unless v.include?(str[index+1])
      end
    }
    true
  end

  def valid?
    valid_allowed_singles and valid_allowed_triples and valid_allowed_subtractions
  end

end
