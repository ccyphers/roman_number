## RomanNumber

### Usage

    RomanNumber.to_i("IV") --> 4
    RomanNumber.to_i("MD") --> 1500
    etc...
    
Alternativly you can call value_for_roman_number dirtly on a String object:

    "IV".value_for_roman_number --> 4
    "MD".value_for_roman_number --> 1500



### Spec
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
