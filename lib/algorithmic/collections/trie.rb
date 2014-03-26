module Collections
  # A trie implementation
  class Trie
    include Enumerable

    attr_accessor :compressed

    # Constructor for the Trie
    def initialize
      @root = TrieNode.new
      @compressed = false
    end

    def add(string, value)
			node = @root
			string.each_char do |char|
				node.children[char] ||= TrieNode.new
				node = node.walk(char)
			end
      node.value = value
			node.terminal = true
    end

    alias_method :[]=, :add

  end

  # A Node for a Trie
  class TrieNode
    attr_accessor :value, :children, :terminal

    # Creates a new trie node
    #
    # @param [Object] value the value to store at this trie
    def initialize(value=nil)
      @children = Hash.new
      @value = value
      @terminal = false
    end

    # Attempts to walk down to the tree to the given letter.
		#
		# @param [String] char the character you are trying to reach
		# @return the node for that char or nil if it doesn't exist
    def walk(char)
      @children[char]
    end

    # Is this node a leaf node
		#
		# @return [Boolean] true if yes false if no
    def leaf?
      @children.count == 0
    end

  end
end
