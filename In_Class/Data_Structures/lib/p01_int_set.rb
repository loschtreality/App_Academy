class MaxIntSet
  attr_accessor :store

  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
     raise "Out of bounds" unless num.between?(0,(@store.size - 1))
    unless @store[num]
      @store[num] = true
    end
  end

  def remove(num)
    if include?(num)
      @store[num] = false
    end
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    unless self.include?(num)
      self[num].push(num)
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].each do |el|
      return true if el == num
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
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
    unless self.include?(num)
      resize! if (@count + 1) > @store.length
      self[num].push(num)
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    if self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store.flatten
    @store = Array.new(@store.length * 2) {Array.new}
    temp_store.each do |num|
      self[num].push(num)
    end
  end
end
