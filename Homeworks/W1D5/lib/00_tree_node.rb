require "byebug"

module Searchable

  def dfs(target)
    return self if self.value == target

      self.children.each do |child|
        answer = child.dfs(target)

        return answer unless answer.nil?
      end

    nil
  end

  def bfs(target)

  stack = [self]
  # debugger
    until stack.empty? do |index|
      stack.push(stack[])
    end

end

class PolyTreeNode
  include Searchable

  attr_accessor :children, :value, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def children
    @children.dup
  end

  def parent=(new_node)
    return if self.parent == new_node

    if @parent
      self.parent._children.delete(self)
    end


    @parent = new_node
    self.parent._children << self unless @parent.nil?

    self
  end


  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child)
    child.parent = nil
     if _children.include?(child)
       _children.delete(child)
     else
    raise "Not a child of this node"
    end
  end


  protected
  def _children
    @children
  end

end





# new_val = PolyTreeNode.new(0)
# mid_par = PolyTreeNode.new(7)
# par = PolyTreeNode.new(1)
#
# child1 = PolyTreeNode.new(2)
# child1.parent = mid_par
#
# child2 = PolyTreeNode.new(3)
# child3 = PolyTreeNode.new(4)
#
# par.children.push(child1)
# par.children.push(child2)
# child1.children.push(child3)
#
# par.parent = new_val
#
# p child1
# p mid_par

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")
#
# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2
#
# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]
#
# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []
