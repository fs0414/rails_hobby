class Stack
  attr_reader :stack_data
  def initialize()
    @stack_data = []
  end

  def push(i)
    @stack_data.push(i)
  end

  def pop
    @stack_data.pop
  end
end

stack = Stack.new
stack.push(1)
stack.push(2)
p stack.stack_data
stack.pop()
p stack.stack_data
