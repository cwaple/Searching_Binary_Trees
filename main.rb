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
  #r = Random.new
  #head_num = r.rand(1...length-1)
  length = list.length
  head_num = 4
  puts "Head num is #{head_num}"
  head = Node.new(list[head_num])
  (0..length-1).step(2) do |index|
    if index == head_num
    else 
      temp_node = Node.new(list[index])
      head.set_node(temp_node)
    end
  end
  (1..length-1).step(2) do |index|
    if index == head_num
    else 
      temp_node = Node.new(list[index])
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

def preorder(node, value)
  if node == nil
  elsif node.get_value == value
    return node
  else
    left = preorder(node.get_left_child, value)
    right = preorder(node.get_right_child, value)
    left or right
  end
end

def inorder(node, value)
  if node == nil
  elsif node.get_value == value
    return node
  else
    left = inorder(node.get_left_child, value)
    right = inorder(node.get_right_child, value)
    left or right
  end
end

def postorder(node, value)
  if node == nil
    return
  elsif node.get_value == value
    return node
  else
    left = postorder(node.get_left_child, value)
    right = postorder(node.get_right_child, value)
    left or right
  end
end

list = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
puts list.inspect
head_node = build_tree(list)

node = postorder(head_node, 7)

puts node.get_value
puts node.get_left_child.get_value
puts node.get_parent.get_parent.get_value