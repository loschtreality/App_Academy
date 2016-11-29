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
    @head
  end

  def last
    @tail
  end

  def empty?
    return true if @head.next == @tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def find_node(key)
    each do |node|
      return node if node.key == key
    end
    nil
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    false
  end

  def insert(key, val)
    new_node = Link.new(key, val)
    new_node.prev = @tail.prev
    @tail.prev.next = new_node

    new_node.next = @tail
    @tail.prev = new_node

  end

  def remove(key)
    item = find_node(key)

    if item
      item.prev.next = item.next
      item.next.prev = item.prev

      item.next, item.prev = nil, nil
      return item.val
    end

  nil
  end

  def each
    current = @head.next
    until current == @tail
      yield(current)
      current = current.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
