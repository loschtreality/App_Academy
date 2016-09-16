# Create a new instance of the Stack class, and play around with adding and removing elements. Remember, a stack follows the principle of LIFO!

class Stack

   def initialize
     @stack = []
   end

   def add(el)
     stack.push(el)
   end

   def remove
     stack.pop
   end

   def show
     stack.each do |el|
       p el
     end
   end

   private
   attr_accessor :stack

 end


# Write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and show.
#  Test your code to ensure it follows the principle of FIFO.

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue.unshift(el)
  end

  def dequeue
    queue.pop
  end

  def show
    queue.each do |el|
      p el
    end
  end

  private
  attr_accessor :queue

end

# A map stores information in key-value pairs, where the keys are alaways unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].

# Our Map class should have the following instance methods: assign(key, value), lookup(key), remove(key), show.

# Note that the assign method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!

# As always, test your code thoroughly to make sure all properties of maps are enforced.

class Map

  def initialize
    @map = []
  end

  def assign(key,value)
    location = lookup(key)
    if location.nil?
      map.push([key,value])
    elsif location
      map.each do |key_val|
        if key_val.first == key
          key_val.pop
          key_val.push(value)
        end
      end
    end
    nil
  end

  def lookup(key)
    map.each do |key_val|
      return key_val.last if key_val.first == key
    end
    nil
  end

  def remove(key)
    map.delete_if { |key_val| key_val.first == key }
  end

  def show
    map.each do |key_val|
      p "#{key_val.first} => #{key_val.last}"
    end
  end

  private
  attr_accessor :map

end
