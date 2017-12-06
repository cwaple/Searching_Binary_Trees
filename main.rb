require "./node"

def merge_sort(list)
  if list.length <= 1
    return list
  end

  left = []
  right = []
  list.each_with_index do |element, index|
    if index < (list.length / 2)
      left.push(element)
    else
      right.push(element)
    end
  end

  left = merge_sort(left)
  right = merge_sort(right)

  return merge(left, right)
end

def merge(left, right)
  result = []
  while !left.empty? && !right.empty? do
    if left[0] <= right[0]
      result.push(left.shift)
    else
      result.push(right.shift)
    end
  end

  while !left.empty? do
    result.push(left.shift)
  end
  while !right.empty? do
    result.push(right.shift)
  end
  result
end

def build_tree(list)
  list = merge_sort(list)
  puts list.inspect
  length = list.length
  middle = length / 2
  head = Node.new(list[middle])
  list.each_with_index do |element, index|
    if index == middle
    else 
      temp_node = Node.new(element)
      head.set_node(temp_node)
    end
  end
  head
end

def breadth_first_search(head)
  queue = []
  queue.push(head)
  until queue.empty?
    if queue[0].get_left_child != nil
      queue.push(queue[0].get_left_child)
    end
    if queue[0].get_right_child != nil
      queue.push(queue[0].get_right_child)
    end
    puts queue.shift.get_value
  end
end

def preorder(node)
  if node == nil
    return
  end
  puts node.get_value
  preorder(node.get_left_child)
  preorder(node.get_right_child)
end

def inorder(node)
  if node == nil
    return
  end
  inorder(node.get_left_child)
  puts node.get_value
  inorder(node.get_right_child)
end

def postorder(node)
  if node == nil
    return
  end
  postorder(node.get_left_child)
  postorder(node.get_right_child)
  puts node.get_value
end

head_node = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])


breadth_first_search(head_node)