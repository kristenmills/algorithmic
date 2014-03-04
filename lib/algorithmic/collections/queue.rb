module Collections
  class Queue
    include Enumerable

    attr_reader :elements

    # Create a new Queue. Can also take a block for default parameter
    #
    # @param [Fixnum] size the size of the default queue
    # @param [Object] default the default value for elements in the queue
    def initialize(size=0, default=nil)
      @elements = Array.new
      size.times do
        self << default
      end
      size.times do
        self << yield
      end
    end

    # Adds an new element to the queue
    #
    # @param [Object] element The element to add to the queuer
    def enqueue(element)
      @elements << element
    end
    alias_method :<<, :enqueue

    # Dequeues an element from the queue
    #
    # @return [Object] the element removed
    def dequeue
      e = @elements[0]
      @elements = @elements.drop(1)
      e
    end

    # Looks at the first element from the queue
    #
    # @return [Object] the first element in the queue
    def front
      @elements[0]
    end
    alias_method :peek, :front

    # Is the queue empty?
    #
    # @return [Boolean] true if yes false if no
    def empty?
      @elements.empty?
    end

    # Gets the size of the queue
    #
    # @return [Fixnum] the size of the queue
    def size
      @elements.size
    end

    # Iterator for a queue
    #
    # @return [Queue] self the queue itself
    def each
      @elements.each do |x|
        yield x
      end
      self
    end

    # Are two queues equal?
    #
    # @return [Boolean] true if yes false if no
    def ==(queue)
      if queue.is_a? Queue
        @elements == queue.elements
      else
        false
      end
    end
  end
end
