class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    unless @store[num]
      @store[num] = true
      return true
    end
    false
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    (num <= @store.length && num >= 0) ? true : false
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
      self[num] << num
  end

  def remove(num)
   self[num].delete(num) if self[num].include?(num)
  end

  def include?(num)
    self[num].each do |n|
      return true if n == n
    end
    false
  end

  private

  def [](num)
    spot = num % @store.length
    @store[spot]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    @count += 1
    resize! if @count > num_buckets
  end

  def remove(num)
    @count -= 1
    self[num].delete(num)
  end

  def include?(num)
    self[num].each { |n| return true if n == num }
    false
  end

  private

  def [](num)
    spot = num % num_buckets
    @store[spot]
  end

  def num_buckets
    @store.length
  end

  def resize!
   old_store = @store
   @count = 0
   @store = Array.new(num_buckets * 2) { Array.new }

   old_store.flatten.each { |num| insert(num) }
 end


end
