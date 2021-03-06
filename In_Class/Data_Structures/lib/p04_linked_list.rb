require "byebug"

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end


#-----------------------------

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true if @head.next == @tail
    false
  end

  def get(key)
    each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    each do |link|
      return true if link.key == key
    end
    false
  end

  def insert(key, val)
    new_link = Link.new(key,val)
      old_reference = @tail.prev
      old_reference.next = new_link
      new_link.next = @tail
      new_link.prev = old_reference
      @tail.prev = new_link
    new_link
  end

  def remove(key)
    prev_node = nil
    next_node = nil
      self.each do |link|
        if link.key == key
          prev_node = link.prev
          next_node = link.next
          link.next = nil
          link.prev = nil
          break
        end
      end
      unless prev_node.nil? && next_node.nil?
        prev_node.next = next_node
        next_node.prev = prev_node
      end
  end

  def each
    link = first
    until link == @tail
      yield link
      link = link.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
