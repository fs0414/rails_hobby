class Queue
  attr_reader :queue_data
  def initialize()
    @queue_data = []
  end

  def enqueue(i)
    @queue_data.push(i)
  end

  def dequeue
    @queue_data.shift
  end
end

queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
p queue.queue_data
p queue.dequeue
p queue.queue_data
