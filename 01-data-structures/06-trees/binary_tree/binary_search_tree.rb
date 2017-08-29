require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
     if root.rating < node.rating 
       root.right.nil? ? root.right = node : insert(root.right, node)
     else
       root.left.nil? ? root.left = node : insert(root.left, node)
     end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if root.nil? || data.nil?
    return root if root.title == data
    root.left ? find(root.left, data) : find(root.right, data)
  end

  def delete(root, data)
    tempNode = find(root, data)
    tempNode.nil? ? nil : (tempNode.title = nil && tempNode.rating = nil)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = Queue.new
    queue.enq(@root)
    while !queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}"
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end
end