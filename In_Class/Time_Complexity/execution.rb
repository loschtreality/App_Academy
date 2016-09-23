require "byebug"

def my_min(array)
  min_num = array.first
  array.each do |el|
    if min_num > el
      min_num = el
    end
  end
  min_num
end

# Time complexity: O(n)


def largest_contiguous_subsum(array)
  subsets(array).map do |subset|
    subset.inject(&:+)
  end.flatten.max
end

def subsets(array)
  subs = []

  array.each_index do |first|
    array.each_index do |second|
      slice = array[first..second]
      subs << slice unless slice.empty?
    end
  end

  subs
end

#Time complexity n^3

# p subsets([5, 3, -7])
# p largest_contiguous_subsum([5,3,-7])

def largest_subsum(array)
  largest = array.max
  prev_sum = array.first
  total = array.first
  array.drop(1).each do |el|
    new_sum = el + prev_sum
    if new_sum < prev_sum
      prev_sum = new_sum
      total = prev_sum
    else
      total += new_sum
    end
    largest = total if total > largest
  end
  largest
end


list = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
# p largest_subsum(list)
p largest_subsum(list2)
# p largest_subsum(list3)
