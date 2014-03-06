require 'spec_helper'

describe Collections::Queue do

  context 'creation' do
    it 'can be created' do
      q = Collections::Queue.new
      expect(q.size).to eq 0
      expect(q.empty?).to be_true
    end

    it 'can be created with default values' do
      q = Collections::Queue.new(1)
      expect(q.size).to eq 1
      expect(q.peek).to be_nil
      expect(q.empty?).to be_false
    end

    it 'can have different default values' do
      q = Collections::Queue.new(1, 30)
      expect(q.size).to eq 1
      expect(q.peek).to eq 30
      expect(q.empty?).to be_false
    end

    it 'can have different default values using a block' do
      q = Collections::Queue.new(1) { Hash.new }
      expect(q.size).to eq 1
      expect(q.peek.class).to eq Hash
      expect(q.empty?).to be_false
    end
  end

  it 'will enqueue and dequeue properly' do
    q = Collections::Queue.new
    q << 1 << 2 << 3 << 4
    expect(q.size).to eq 4
    expect(q.empty?).to be_false
    1.upto(4) do |x|
      expect(q.dequeue).to eq x
    end
    expect(q.size).to eq 0
    expect(q.empty?).to be_true
  end

  it 'iterates properly' do
    q = Collections::Queue.new << 0 << 1 << 2 << 3
    q.each_with_index do |element, index|
      expect(element).to eq index
    end
  end

  context 'equivalenece' do
    it 'is equal to equivalent queues' do
      q1 = Collections::Queue.new
      q1 << 1 << 2 << 3 << 4
      q2 = Collections::Queue.new
      q2 << 1 << 2 << 3 << 4
      expect(q1 == q2).to be_true
    end

    it 'is not equal to queues that are not equivalent' do
      q1 = Collections::Queue.new
      q2 = Collections::Queue.new(1,"monkey")
      expect(q1 == q2).to be_false
    end

    it 'is not equal to random other things' do
      q1 = Collections::Queue.new
      a1 = Array.new
      expect(q1 == a1).to be_false
    end
  end
end
