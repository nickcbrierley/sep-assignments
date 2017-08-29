require_relative 'node'

class OpenAddressing
  
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    hashIndex = index(key, size)
    x = @items[hashIndex]

    if x.nil?
      @items[hashIndex] = Node.new(key, value)
    elsif x.key != key 
      self.resize 
      self[key] = value 
    elsif (x.key === key) && (x.value != value)
      if self.next_open_index(@items[hashIndex]) === -1
        self.resize
        @items[hashIndex] = value
      else
        @items[hashIndex] = value
      end
    end
  end

  def [](key)
    if @items[index(key,size)].key === key
      @items[index(key, size)].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    @items.each do |x|
      if  x.nil?
        return index
      else
        return -1
      end
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    array = @items
    @items = Array.new(array.length * 2)
    array.each{ |x| self[x.key] = x.value unless x.nil? }
  end
  
  def print
    @items.inspect
  end
end