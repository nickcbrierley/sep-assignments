require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @count = 0
  end

  def []=(key, value)
    hashIndex = index(key, @items.size)
    item = Node.new(key, value)
    
    if @items[hashIndex] != nil
      list = @items[hashIndex]
    else
      list = LinkedList.new
    end
    
    list.add_to_tail(item)
    @items[hashIndex] = list
    @count += 1
    
    if load_factor> @max_load_factor
      resize
    end
  end
  
  def [](key)
    temp = @items[index(key, size)]
    if temp != nil
      tempHead = temp.head
      while tempHead != nil
        if tempHead.key === key
          return tempHead.value
        end
        tempHead = tempHead.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @count / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = Array.new(@items.length * 2)
    (0..@items.size).each do |i|
      list = @items[i]
      if list != nil
        tempHead = list.head
        new_index = index(tempHead.key, temp.size)
        while tempHead != nil
          list = LinkedList.new
          list.add_to_tail(tempHead)
          temp[new_index] = list
          tempHead = tempHead.next
        end
      end
    end
    @items = temp
  end
  
  def print
    @items.inspect
    l = load_factor
    puts "Load factor: #{l}"
  end
end