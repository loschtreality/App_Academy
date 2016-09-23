require "byebug"

def bad_two_sum?(arr,target_sum)
  arr.each_with_index do |num, i|
    arr.each_with_index do |num2, j|
      next if i >= j
      return true if num + num2 == target_sum
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# Time complexity O(n^2) - Quadratic

#
# def okay_two_sum?(arr,target)
#   arr = arr.sort
#   arr.each_with_index do |el, idx|
#     arr.bsearch{|el2| target - el}
# end
#
# def binary_search(array,target)
#   return false if array.empty?
#   prc = Proc.new {|a,b| a <=> b}
#   mid = array.size / 2
#   pivot = array[mid]
#
#   case prc.call(pivot,target)
#   when -1
#     binary_search(array.take(mid),target)
#   when 0
#     mid
#   when 1
#     step = binary_search(array.drop(mid + 1), target)
#     step.nil? ? false : mid + pivot + 1
#   end
#
# end


  # def okay_two_sum?(arr,target)
  #   arr.sort!
  #   arr.any? do |el|
  #     result = arr.bsearch {|el2| target - el - el2 }
  #     next unless result
  #
  #   end
  # end
#
#
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def pair_sum?(array, target)
  hash = Hash.new
  array.each do |num|
    hash[num] = num
  end
  hash.each do |k,v|
    diff = target - v
    if hash[diff]
      return true unless diff == v
    end
  end
  false
end

p pair_sum?(arr, 6) # => should be true
p pair_sum?(arr, 10) # => should be false
