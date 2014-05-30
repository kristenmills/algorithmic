require 'spec_helper'

describe Collections::Dequeue do
  context 'creation' do
    it 'can be created' do
      dq = Collections::Dequeue.new
      expect(dq.size).to eq 0
      expect(dq.empty?).to be_true
    end

    it 'can be created with default values' do
      dq = Collections::Dequeue.new(1)
      expect(dq.size).to eq 1
      expect(dq.peek_front).to be_nil
      expect(dq.peek_back).to be_nil
      expect(dq.empty?).to be_false
    end

    it 'can have different default values' do
      dq = Collections::Dequeue.new(1, 30)
      expect(dq.size).to eq 1
      expect(dq.peek_front).to eq 30
      expect(dq.peek_back).to eq 30
      expect(dq.empty?).to be_false
    end

    it 'can have different default values using a block' do
      dq = Collections::Dequeue.new(1) { Hash.new }
      expect(dq.size).to eq 1
      expect(dq.peek_front.class).to eq Hash
      expect(dq.empty?).to be_false
    end
  end

  context 'adding and removing' do
    it 'will push and pop properly' do
      dq = Collections::Dequeue.new
      dq << 1 << 2 << 3 << 4
      expect(dq.size).to eq 4
      expect(dq.empty?).to be_false
      4.downto(1) do |x|
        expect(dq.pop).to eq x
      end
      expect(dq.size).to eq 0
      expect(dq.empty?).to be_true
    end

    it 'will shift and unshift properly' do
      dq = Collections::Dequeue.new
      dq.unshift(1).unshift(2).unshift(3).unshift(4)
      expect(dq.size).to eq 4
      expect(dq.empty?).to be_false
      4.downto(1) do |x|
        expect(dq.shift).to eq x
      end
      expect(dq.size).to eq 0
      expect(dq.empty?).to be_true
    end
  end

  it 'iterates properly' do
    dq = Collections::Dequeue.new << 0 << 1 << 2 << 3
    dq.each_with_index do |element, index|
      expect(element).to eq index
    end
  end

  context 'equivalenece' do
    it 'is equal to equivalent queues' do
      dq1 = Collections::Dequeue.new
      dq1 << 1 << 2 << 3 << 4
      dq2 = Collections::Dequeue.new
      dq2 << 1 << 2 << 3 << 4
      expect(dq1 == dq2).to be_true
    end

    it 'is not equal to dequeues that are not equivalent' do
      dq1 = Collections::Dequeue.new
      dq2 = Collections::Dequeue.new(1,"monkey")
      expect(dq1 == dq2).to be_false
    end

    it 'is not equal to random other things' do
      dq1 = Collections::Dequeue.new
      a1 = Array.new
      expect(dq1 == a1).to be_false
    end
  end

end