class Node
  def initialize(value = nil, parent = nil, left_child = nil, right_child = nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
    @parent = parent
  end

  def get_parent
    @parent
  end

  def get_left_child
    @left_child
  end

  def get_right_child
    @right_child
  end

  def set_parent(node)
    @parent = node
  end

  def set_node(node)
    if node.get_value <= @value
      if @left_child == nil
        node.set_parent(self)
        @left_child = node
      else
        @left_child.set_node(node)
      end
    else
      if @right_child == nil
        node.set_parent(self)
        @right_child = node
      else
        @right_child.set_node(node)
      end
    end
  end

  def set_value(value)
    @value = value
  end

  def get_value
    @value
  end
end