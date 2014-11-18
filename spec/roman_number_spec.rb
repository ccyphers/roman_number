base = File.expand_path("#{File.dirname(__FILE__)}/..")
require "#{base}/lib/roman_number"

describe "RomanNumber" do

  it "should test all code paths using interface" do
    test_set = [ 
                 {:data => 'I', :results => true, :sum => 1},
                 {:data => 'MCMIII', :results => true, :sum => 1903},
                 {:data => 'II', :results => true, :sum => 2},
                 {:data => 'IV', :results => true, :sum => 4},
                 {:data => 'IVI', :results => true, :sum => 5},
                 {:data => 'IVII', :results => true, :sum => 6},
                 {:data => 'VI', :results => true, :sum => 6},
                 {:data => 'd', :results => true},
                 {:data => 'D', :results => true},
                 {:data => 'dd', :results => false},
                 {:data => 'Dd', :results => false},
                 {:data => 'iIiI', :results => false},
                 {:data => 'iiixiViiiX', :results => true},
                 {:data => 'iiixiViiiiX', :results => false},

                 #limit when IXC can appear
                 {:data => "IV", :results => true},
                 {:data => "IX", :results => true},
                 {:data => "IL", :results => false}

                ]
    test_set.each { |i|
      puts "Testing: #{i.inspect}"
      command = proc { i[:data].value_for_roman_number }
      if i[:results]
        sum = command.call
        if i.has_key?(:sum)
          sum.should == i[:sum]
        end
      else
        command.should raise_error InvalidRomanNumberFormat
      end
    }

  end

end
