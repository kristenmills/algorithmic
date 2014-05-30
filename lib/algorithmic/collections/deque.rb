module Collections
  # Double ended queue implementation
  class Deque
    include Enumerable

    # Create a new deque. Can also take a block for default parameter
    #
    # @param [Fixnum] size the size of the default deque
    # @param [Object] default the default value for elements in the deque
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

    # Adds a new element to the back of the deque
    #
    # @param [Object] element the element to add to the deque
    # @return [Deque] the deque itself
    def push(element)
      @elements << element
      self
    end
    alias_method :<<, :push

    # Adds a new element to the front of the deque
    #
    # @param [Object] element the element to add to the deque
    # @return [Deque] the deque itself
    def unshift(element)
      @elements.unshift(element)
      self
    end

    # Removes an element from the back of a deque
    #
    # @return [Object] the element removed
    def pop
      @elements.pop
    end

    # Removes an element from the front of the deque
    #
    # @return [Object] the element removed
    def shift
      @elements.shift
    end

    # Looks at the first element from the deque
    #
    # @return [Object] the first element in the deque
    def front
      @elements.first
    end
    alias_method :peek_front, :front

    # Looks at the last element from the deque
    #
    # @return [Object] the last element in the deque
    def back
      @elements.last
    end
    alias_method :peek_back, :back

    # Is the deque empty?
    #
    # @return [Boolean] true if yes, false if no
    def empty?
      @elements.empty?
    end

    # Gets the size of the deque
    #
    # @return [Fixnum] the size of the deque
    def size
      @elements.size
    end

    # Iterator for a deque
    #
    # @return [deQue] the deque itself
    def each
      @elements.each do |x|
        yield x
      end
      self
    end

    # Are two deques equal?
    #
    # @return [Boolean] true if yes, false if no
    def ==(deque)
      if deque.is_a? Deque
        @elements == deque.to_a
      else
        false
      end
    end

    # Convert the deque into an array
    #
    # @return [Array] the array representation of this deque
    def to_a
      @elements
    end

    # Get a string representation of the deque
    #
    # @return [String] string representation of the deque
    def inspect
      @elements.inspect
    end

    alias_method :to_s, :inspect
  end
end
