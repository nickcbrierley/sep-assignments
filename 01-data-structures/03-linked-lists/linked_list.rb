require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil && @tail == nil
      @tail = node
      @head = node
    else
      temp = @tail
      @tail = node
      temp.next = @tail
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    temp = @head
    if @head == @tail
      @tail = nil
      @head = nil
    else
      while temp.next != @tail
        temp = temp.next 
      end
    end
    if temp.next == @tail 
      @tail = temp
    end
  end

  # This method prints out a representation of the list.
  def print
    temp = @head
    while temp != nil
      puts temp.data
      temp = temp.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp = @head
    if node == @head
      remove_front
    elsif node == @tail
      remove_tail
    else 
      while temp.next != node
        temp = temp.next
      end
      temp.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @tail = node
      @head = node
    end
    temp = @head
    @head = node 
    @head.next = temp
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    if @head == @tail
      @head = nil 
      @tail = nil
    else
      @head = @head.next
    end
    return temp
  end
end