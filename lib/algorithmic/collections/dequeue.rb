module Collections
  # Double ended queue implementation
  class Dequeue
    include Enumerable

    # Create a new dequeue. Can also take a block for default parameter
    #
    # @param [Fixnum] size the size of the default dequeue
    # @param [Object] default the default value for elements in the dequeue
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

    # Adds a new element to the back of the dequeue
    #
    # @param [Object] element the element to add to the dequeue
    # @return [Dequeue] the dequeue itself
    def push(element)
      @elements << element
      self
    end
    alias_method :<<, :push

    # Adds a new element to the front of the dequeue
    #
    # @param [Object] element the element to add to the dequeue
    # @return [Dequeue] the dequeue itself
    def unshift(element)
      @elements.unshift(element)
      self
    end

    # Removes an element from the back of a dequeue
    #
    # @return [Object] the element removed
    def pop
      @elements.pop
    end

    # Removes an element from the front of the dequeue
    #
    # @return [Object] the element removed
    def shift
      @elements.shift
    end

    # Looks at the first element from the dequeue
    #
    # @return [Object] the first element in the dequeue
    def front
      @elements.first
    end
    alias_method :peek_front, :front

    # Looks at the last element from the dequeue
    #
    # @return [Object] the last element in the dequeue
    def back
      @elements.last
    end
    alias_method :peek_back, :back

    # Is the dequeue empty?
    #
    # @return [Boolean] true if yes, false if no
    def empty?
      @elements.empty?
    end

    # Gets the size of the dequeue
    #
    # @return [Fixnum] the size of the dequeue
    def size
      @elements.size
    end

    # Iterator for a dequeue
    #
    # @return [deQueue] the dequeue itself
    def each
      @elements.each do |x|
        yield x
      end
      self
    end

    # Are two dequeues equal?
    #
    # @return [Boolean] true if yes, false if no
    def ==(dequeue)
      if dequeue.is_a? Dequeue
        @elements == dequeue.to_a
      else
        false
      end
    end

    # Convert the dequeue into an array
    #
    # @return [Array] the array representation of this dequeue
    def to_a
      @elements
    end

    # Get a string representation of the dequeue
    #
    # @return [String] string representation of the dequeue
    def inspect
      @elements.inspect
    end

    alias_method :to_s, :inspect
  end
end
