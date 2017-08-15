class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @index = 0
  end

  def push(item)
    @index += 1
    self.top = item
    @stack[@index] = self.top
  end

  def pop
    item = self.top
    @stack[@index] = nil
    @index -= 1
    self.top = @stack[@index]
    return item
  end

  def empty?
    if @index > 0 then
      return false
    else
      return true
    end
  end
end