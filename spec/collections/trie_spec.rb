require 'spec_helper'

describe Collections::Trie do
  context 'creation' do
    it 'can be created' do
      trie = Collections::Trie.new
      expect(trie.size).to eq 0
      expect(trie.empty?).to be_true
      expect(trie['cheese']).to be_nil
    end

    it 'can be created with default values' do
      trie = Collections::Trie.new(0)
      expect(trie.size).to eq 0
      expect(trie.empty?).to be_true
      expect(trie['cheese']).to eq 0
    end
  end

  it 'will add and delete properly' do
    trie = Collections::Trie.new
    trie['Hello'] = 'world'
    trie['Cheese'] = 'awesome'
    expect(trie.has_key?('Cheese')).to be_true
    expect(trie.has_key?('Hello')).to be_true
    trie.delete('Cheese')
    expect(trie.has_key?('Cheese')).to be_false
    expect(trie.has_key?('Hello')).to be_true
  end
end
