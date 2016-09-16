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

    until stack.empty?
      stack.push(*stack.first.children)
      item = stack.shift
      if item.value == target
        return item
      end
    end
    nil
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
