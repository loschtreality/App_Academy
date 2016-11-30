class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.size <= 1

    pivot = array.first
    left = []
    right = []

    (1...array.length).each do |i|
      element = array[i]
      case pivot <=> element
      when 0
        left << element
      when -1
        right << element
      when 1
        left <<  element
      end
    end

    self.sort1(left) + [pivot] + self.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if length <= 1

    pivot = array[start]
    wall = start + 1

    ((start + 1)...(start + length)).each do |i|
      element = array[i]
      case prc.call(pivot, element)
      when 0
         if (i - wall > 1)
          array[wall + 1], array[i] = array[i], array[wall + 1]
        end
        wall += 1
      when -1
        next
      when 1
        if (i - wall > 1)
         array[wall + 1], array[i] = array[i], array[wall + 1]
       end
       wall += 1
      end
    end

    array[start], array[wall] = array[wall], array[start]

    pivot = array[wall]

    self.sort2!(array, start, wall) + [pivot] + self.sort2!(array, wall)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    pivot_idx, pivot = start, array[start]
    ((start + 1)...(start + length)).each do |idx|
      val = array[idx]
      if prc.call(pivot, val) < 1
      else
        array[idx] = array[pivot_idx + 1]
        array[pivot_idx + 1] = pivot
        array[pivot_idx] = val
        pivot_idx += 1
      end
    end

    pivot_idx
  end




end
