require 'byebug'

class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTree

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      BinarySearchTree.insert!(@root,value)
    end
  end

  def find(value)
    search = BinarySearchTree.find!(@root, value)
    return nil if search.nil?
    search
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@node, value)
  end

  def self.insert!(node, value)
    # set new node value if no node is passsed in
    node = BSTNode.new(value) if node.nil?
    case node.value <=> value

      # when the node value is less than the passed value
    when -1
      if node.right
        # recurse if present
        self.insert!(node.right, value)
      else
        # set if not present
        node.right = BSTNode.new(value)
      end

      # when node value is greater than the passed value
    when 1
      if node.left
        self.insert!(node.left, value)
      else
        node.left = BSTNode.new(value)
      end

      # when the values are equal, default to the left side
    when 0
      if node.left
        self.insert!(node.left, value)
      else
        node.left = BSTNode.new(value)
      end
    end
     node
  end

  def self.find!(node, value)
    return nil if node.nil?

    case node.value <=> value
    when -1
      # recurse right when the node value is less than the passed value
      return self.find!(node.right, value)

    when 1
      # recurse left when the node value is greater than the passed value
      return self.find!(node.left, value)

    when 0
      # return node if values are equal
      return node
    end

    nil
  end

  def self.preorder!(node)
    return [] if node.nil?

     [node.value] + self.preorder!(node.left) + self.preorder!(node.right)
  end

  def self.inorder!(node)
    return [] if node.nil?

    self.inorder!(node.left) + [node.value] + self.inorder!(node.right)
  end

  def self.postorder!(node)
    return [] if node.nil?

    self.postorder!(node.left) + self.postorder!(node.right) + [node.value]
  end

  def self.height!(node)
    # if unexistant node
    return -1 if node.nil?

    # if only child
    return 0 if (node.left.nil? && node.right.nil?)

    # start count with 1, recursively add left and right sides separately
    left_count = 1
    right_count = 1

    left_count += self.height!(node.left)
    right_count += self.height!(node.right)

    # return the greater of the left and right
    return [left_count, right_count].max
  end

  def self.max(node)
    # return nil if node isn't passed in
    return nil if node.nil?

    max = node.right
    current_node = node.right

    # check find the right-most child
    until current_node.right.nil?
      max = current_node.right
      current_node = current_node.right
    end

    # return right-most child node
    max
  end

  def self.min(node)

    # return nil if node isn't passed in
    return nil if node.nil?
    min = node.left
    current_node = node.left

    # check find the left-most child
    until current_node.left.nil?
      min = current_node.left
      current_node = current_node.left
    end

      # return left-most child node
    min
  end

  def self.delete_min!(node)
    return nil unless node

    # return the right node if the left isn't present
    return node.right unless node.left

    # left node will be set to nil in the base case, right-side node will be returned if present
    node.left = self.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil if node.nil?

    case node.value <=> value
      # Recurse right when node value is less than passed value
    when -1
      node.right = self.delete!(node.right, value)

    when 1
      # Recurse left when node value is greater than passed value
      node.left = self.delete!(node.left, value)
      
    when 0
      # Return children if they exist
      return node.left unless node.right
      return node.right unless node.left


      original = node

      node = original.right.min
      node.right = self.delete_min!(original.right)
      node.left = original.left
    end

    node
  end

end
