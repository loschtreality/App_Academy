require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    self.capacity = 8
    self.store = StaticArray.new(8)
    self.length = 0
    self.start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    self.store[(start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    self.store[(start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    check_index(-1) if length == 0
    val = self[length - 1]
    self[length - 1] = nil
    self.length -= 1
    val
  end

  # O(1) ammortized
  def push(val)
    self.length += 1
    resize! if length == capacity
    self[length - 1] = val
    nil
  end

  # O(1)
  def shift
    check_index(-1) if length == 0
    val = self[0]
    self[0] = nil
    self.start_idx = (start_idx + 1) % capacity
    self.length -= 1

    val
  end


  # O(1) ammortized
  def unshift(val)
    resize! if (length == capacity)

    self.start_idx = (start_idx - 1) % capacity
    self.length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    unless (index >= 0) && (index <= self.length - 1)
      raise "index out of bounds"
    end
  end

  def resize!
    new_array = StaticArray.new(self.capacity * 2)
      (self.length).times do |i|
        new_array[i] = self.store[i]
      end
    self.capacity = self.capacity * 2
    self.store = new_array
    self.start_idx = 0
  end
end
