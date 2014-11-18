require File.expand_path(File.dirname(__FILE__) + '/..') + '/roman_number'

class String
  def grep(search)
    self.split('').grep(search)
  end
  def value_for_roman_number
    RomanNumber.to_i(self)
  end
end

