require 'spec_helper'

describe Collections::Stack do
  context 'creation' do
    it 'can be created' do
      stack = Collections::Stack.new
      expect(stack.size).to eq 0
      expect(stack.empty?).to be_true
    end

    it 'can be created with default values' do
      stack = Collections::Stack.new(1)
      expect(stack.size).to eq 1
      expect(stack.peek).to be_nil
      expect(stack.empty?).to be_false
    end

    it 'can have different default values' do
      stack = Collections::Stack.new(1, 30)
      expect(stack.size).to eq 1
      expect(stack.peek).to eq 30
      expect(stack.empty?).to be_false
    end

    it 'can have different default values using a block' do
      stack = Collections::Stack.new(1) { Hash.new }
      expect(stack.size).to eq 1
      expect(stack.peek.class).to eq Hash
      expect(stack.empty?).to be_false
    end
  end

  it 'will push and pop properly' do
    stack = Collections::Stack.new
    stack << 1 << 2 << 3 << 4
    expect(stack.size).to eq 4
    expect(stack.empty?).to be_false
    4.downto(1) do |x|
      expect(stack.pop).to eq x
    end
    expect(stack.size).to eq 0
    expect(stack.empty?).to be_true
  end

  it 'iterates properly' do
    stack = Collections::Stack.new << 0 << 1 << 2 << 3
    stack.each_with_index do |element, index|
      expect(element).to eq 3 - index
    end
  end

  context 'equivalenece' do
    it 'is equal to equivalent queues' do
      s1 = Collections::Stack.new
      s1 << 1 << 2 << 3 << 4
      s2 = Collections::Stack.new
      s2 << 1 << 2 << 3 << 4
      expect(s1 == s2).to be_true
    end

    it 'is not esual to stacks that are not equivalent' do
      s1 = Collections::Stack.new
      s2 = Collections::Stack.new(1,"monkey")
      expect(s1 == s2).to be_false
    end

    it 'is not equal to random other things' do
      s1 = Collections::Stack.new
      a1 = Array.new
      expect(s1 == a1).to be_false
    end
  end
end
