require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    self.capacity = 8
    self.store = StaticArray.new(capacity)
    self.length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    self.store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    self.store[index] = value
  end

  # O(1)
  def pop
    check_index(-1) if self.length == 0
    self.store[self.length - 1] = nil
    self.length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    self.length += 1
    resize! if self.length > capacity
    self.store[self.length] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    check_index(-1) if self.length == 0
    (self.length).downto(1) do |i|
      j = i - 1
      self.store[j] = self.store[i]
    end
    self.length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    self.length += 1
    resize! if self.length > capacity
    (length - 2).downto(0).each do |i|
      self.store[i + 1] = self.store[i]
    end
    self.store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    unless (index >= 0) && (index <= self.length - 1)
      raise "index out of bounds"
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_array = StaticArray.new(self.capacity * 2)
    (self.length).times do |i|
      new_array[i] = self.store[i]
    end
    self.capacity = self.capacity * 2
    self.store = new_array
  end


end
