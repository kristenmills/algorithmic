module Collections
  # A trie implementation
  class Trie
    include Enumerable
    #TODO implement each

    attr_reader :size
    # Constructor for the Trie
    #
    # @param [Object] default the default value for the trie
    def initialize(default=nil)
      @default = default
      @root = TrieNode.new(default)
      @compressed = false
      @size = 0
    end

    # Adds a new key value pair to the trie
    #
    # @param [String] key the key
    # @param [Object] value the value to be stored at the key
    def add(key, value)
      node = @root
      key.each_char do |char|
        node.children[char] ||= TrieNode.new(@default_value)
        node = node.walk(char)
      end
      node.value = value
      @size += 1 unless node.terminal
      node.terminal = true
      value
    end

    alias_method :[]=, :add

    # Delete a key from the the trie
    #
    # @param [String] key the string to delete
    # @return [Object] the value at the key or default value if it isn't there
    def delete(key)
      node = @root
      key.each_char do |c|
        return @default_value unless node = node.walk(c)
      end
      @size -=1 if node.terminal
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
      key.each_char do |c|
        return @default unless node = node.walk(c)
      end
      node.value
    end

    alias_method :[], :get

    # Does the trie have the given key
    #
    # @param [String] key the key you are searching for
    # @return [Boolean] true if it has the key false if it doesn't
    def has_key?(key)
      node = @root
      key.each_char do |c|
        return false unless node = node.walk(c)
      end
      node.terminal ? true : false
    end

    # Tries to match a given string. '*' represent wildcards
    #
    # @param [String] string the match String
    # @param [TrieNode] node the starting node
    # @param [String] prefix what has already been matched
    # @return [Array] a list of matching strings
    # @example
    #    add('Chair')
    #    add('Champ')
    #    match('Cha**') #=> [Chair, Champ]
    def match(string, node=@root, prefix='')
      if node.nil?
        []
      elsif string == ''
        if node.terminal
          [prefix]
        else
          []
        end
      else
        char = string[0]
        array = []
        unless char == '*'
          n = node.walk(char)
          array += match_recursive(n, string[1..-1], prefix+ char)
        else
          node.children.each_key do |child|
            array += match_recursve(node.walk(child), string[1..-1], prefix+child)
          end
        end
        array
      end
    end

    def empty?
      size == 0
    end
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
