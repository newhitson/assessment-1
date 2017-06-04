require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil , &prc)
    if accumulator == nil
      accumulator = self[0]
      range = self[1..-1]
    else
      range = self[0..-1]
    end

    range.each do |el|
      accumulator = prc.call(accumulator,el)
    end
accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
  true
end

def primes(num)
  result = []
  i = 2

  until result.length == num
    result << i if is_prime?(i)
    i+=1
  end
  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1

  result_array = factorials_rec(num-1)
  result_array =  result_array + [result_array.last * (num-1)]

end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new{|h,k| h[k] = []}

    each_with_index do |num, i|
      hash[num] << i
    end

    hash.select{|k,v| v.length > 1}
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []

    chars.each_with_index do |el, i|
      word = el
      (i+1...self.length).each do |el2|
        word += self[el2]
        result << word if word == word.reverse
      end
    end
    result
  end
end

class Array
  #
  # # Write an Array#merge_sort method; it should not modify the original array.
  #
  # def merge_sort(&prc)
  #
  #
  #
  # end
  #
  # private
  # def self.merge(left, right, &prc)
  #   result = []
  #
  #   until left.empty? || right.empty?
  #     case prc.call(left[0],right[0])
  #     when -1
  #       result << left.shift
  #     when 0
  #       result << left.shift
  #     when 1
  #       result << right.shift
  #     end
  #   result + left + right
  # end
end
