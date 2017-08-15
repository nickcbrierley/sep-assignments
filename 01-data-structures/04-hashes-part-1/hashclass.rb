require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    hashIndex = index(key, size)

    if @items[hashIndex].nil?
      @items[hashIndex] = HashItem.new(key, value)
    elsif @items[hashIndex].key != key 
      self.resize 
      self[key] = value 
    elsif (@items[hashIndex].key === key) && (@items[hashIndex].value != value) 
      self.resize 
      @items[hashIndex] = value
    end
  end

  def [](key)
    if @items[index(key,size)].key === key
      @items[index(key, size)].value
    end
  end

  def resize
    array = @items
    @items = Array.new(array.length * 2)
    array.each{ |x| self[x.key] = x.value unless x.nil? }
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end
  
end