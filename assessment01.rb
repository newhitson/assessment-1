require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil , &prc)

    self.each_with_index do |el, i|
      if i == 0 && !accumulator
        accumulator = el
        next
      end
      accumulator = prc.call(accumulator, el)
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
    if is_prime?(i)
      result << i
    end
    i += 1
  end
  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  factorials_rec(num-1)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    numbers = []
    hash = Hash.new(0)
    self.each {|num| hash[num] += 1}
    hash.each {|k,v| numbers << k if hash[k] > 1 }
      numbers
    result = Hash.new([])
    numbers.each {|num| result[num] << 1}
    result



  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    self.chars.each_with_index do |let , i1|
      temp = let
      result << temp
      self.chars.each_with_index do |let2, i2|
        if i2 > i1
          temp += let2
          result << temp
        end
      end
      temp = ""
    end
    result

    result.select {|word| word == word.reverse && word.length > 1}
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
