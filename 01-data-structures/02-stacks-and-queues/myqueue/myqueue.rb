class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @index = 0
  end

  def enqueue(element)
    @queue[@index] = element
    @head = @queue[0]
    @tail = @queue[@index]
    @index += 1
  end

  def dequeue
    temp = @queue[0]
    @queue.delete_at(0)
    @head = @queue[0]
    @index = @queue.length - 1
    @tail = @queue[@index]
    return temp
  end

  def empty?
    if @queue.length === 0
      true
    else
      false
    end
  end
end