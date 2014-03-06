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

    def push(element)
      @elements.unshift(element)
    end
    alias_method :<<, :push

    def pop
      @elements.shift
    end

    def front
      @elements.first
    end

    def empty?
      @elements.empty?
    end

    def size
      @elements.size
    end

    def each
      @elements.each do |x|
        yield x
      end
      self
    end

    def ==(stack)
      if stack.is_a? Stack
        @elements == stack.to_a
      else
        false
      end
    end

    def to_a
      @elements
    end

    def inspect
      @elements.inspect
    end
    alias_method :to_s, :inspect
  end
end
