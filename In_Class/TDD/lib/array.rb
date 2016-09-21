
class Array
  def my_uniq
    answer = []
    self.each_with_index do |el, idx|
      if self.index(el) == idx
        answer << el
      end
    end
    return answer
  end

  def two_sum
    answer = []
    self.each_with_index do |el,idx|
      opposite = el * -1
      if self.include?(opposite)
        next if self.index(opposite) == idx
        next if answer.include?([idx, self.index(opposite)].reverse)
        answer << [idx, self.index(opposite)]
      end
    end
    answer.sort!
  end

  def my_transpose
    answer = []
    self.each_index do |i|
      row = []
      self[i].each_index do |j|
        row << self[j][i]
      end
      answer << row
    end
    answer
  end
end


def stock_picker(array)
  raise NoMethodError unless array.is_a?(Array)
  raise "not enough days" if array.length == 1
  answer = nil
  max_diff = 0
  array.each_with_index do |price, day|
    array[(day + 1)...array.length].each_with_index do |p2, day2|
      day2 += 1
      p_diff = p2 - price
      if p_diff > max_diff
        max_diff = p_diff
        answer = [day, day2]
      end
    end
  end
  answer
end
