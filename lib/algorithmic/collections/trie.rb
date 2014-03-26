module Collections
  # A trie implementation
  class Trie
    include Enumerable

    attr_accessor :compressed

    # Constructor for the Trie
    #
    # @param [Object] default the default value for the trie
    def initialize(default)
      @default = default
      @root = TrieNode.new(default)
      @compressed = false
    end

    # Adds a new key value pair to the trie
    #
    # @param [String] key the key
    # @Param [Object] value the value to be stored at the key
    def add(key, value)
			node = @root
			key.each_byte do |char|
				node.children[char-65] ||= TrieNode.new(@default_value)
				node = node.walk(char)
			end
      node.value = value
			node.terminal = true
    end

    alias_method :[]=, :add

    # Delete a key from the the trie
    #
    # @param [String] key the string to delete
    # @return [Object] the value at the key or default value if it isn't there
    def delete(key)
      node = @root
			word.each_byte do |c|
				return @default_value unless node = node.walk(c)
			end
			node.terminal = false
      val = node.value
      node.value = @default_value
      val
    end

    # Get the value at the given key
    #
    # @param [String] key the key you are trying to access
    # @return [Object] the value at the given key
    def get(key)
      node = @root
      word.each_byte do |c|
        return @default_value unless node = node.walk(c)
      end
      node.value
    end

    alias_method :[], :get

    # Does the trie have the given key
    #
    # @param [String] key the key you are searching for
    # @return true if it has the key false if it doesn't
    def has_key?(key)
      node = @root
      word.each_byte do |c|
        return false unless node = node.walk(c)
      end
      node.terminal? ? true : false
    end
  end

  # A Node for a Trie
  class TrieNode
    attr_accessor :value, :children, :terminal

    # Creates a new trie node
    #
    # @param [Object] value the value to store at this trie
    def initialize(value=nil)
      @children = Array.new(26)
      @value = value
      @terminal = false
    end

    # Attempts to walk down to the tree to the given letter.
		#
		# @param [String] char the character you are trying to reach
		# @return the node for that char or nil if it doesn't exist
    def walk(char)
      @children[char-65]
    end

    # Is this node a leaf node
		#
		# @return [Boolean] true if yes false if no
    def leaf?
      @children.count == 0
    end

  end
end
