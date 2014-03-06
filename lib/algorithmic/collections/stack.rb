module Collections
  class Stack
    include Enumerable

    # Create a new Stack. Can also take a block for default parameter
    #
    # @param [Fixnum] size the size of the default stack
    # @param [Object] default the default value for elements in the stack
    def initialize(size=0, default=nil, &block)
      @elements = Array.new
      if(block.nil?)
        size.times do
          self << default
        end
      else
        size.times do
          self << yield
        end
      end
    end

    # Push an element onto the stack
    #
    # @param [Object] element the element to push onto the stack
    def push(element)
      @elements.unshift(element)
    end
    alias_method :<<, :push

    # Pop an element of the stack
    #
    # @return [Object] the element popped off the stack
    def pop
      @elements.shift
    end

    # Looks at the first element on the stack
    #
    # @return [Object] the first element on the stack
    def front
      @elements.first
    end
    alias_method :peek, :front

    # Is the stack empty?
    #
    # @return [Boolean] true if yes, false if no
    def empty?
      @elements.empty?
    end

    # Get the size of the stack
    #
    # @return [Fixnum] the size of the stack
    def size
      @elements.size
    end

    # Iterator for the stack
    #
    # @return [Stack] the stack itself
    def each
      @elements.each do |x|
        yield x
      end
      self
    end

    # Are the two stacks equal?
    #
    # @return [Boolean] true if yes, false if no
    def ==(stack)
      if stack.is_a? Stack
        @elements == stack.to_a
      else
        false
      end
    end

    # Convert the stack into an array
    #
    # @return [Array] the array representation of this stack
    def to_a
      @elements
    end

    # Get a string representation of the stack
    #
    # @return [String] string representation of the queue
    def inspect
      @elements.inspect
    end
    alias_method :to_s, :inspect
  end
end
