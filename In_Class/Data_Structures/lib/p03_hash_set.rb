require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hashed = key.hash
    unless self.include?(key)
      resize! if (@count + 1) > @store.length
      self[hashed].push(key)
      @count += 1
    end
  end

  def include?(key)
    hashed = key.hash
    (self[hashed].include?(key)) ? true : false
  end

  def remove(key)
    hashed = key.hash
    if self.include?(key)
      self[hashed].delete(key)
      @count -= 1
    end
  end

  private

  def [](hashed_val)
    @store[hashed_val % @store.length]# optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store.flatten
    @store = Array.new(@store.length * 2) {Array.new}
    temp_store.each do |key|
      hashed = key.hash
      self[key].push(key)
    end
  end
end
