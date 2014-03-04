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
  
  end
end
