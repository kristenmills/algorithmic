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

  it ' will get the node properly' do
    trie = Collections::Trie.new
    trie['Hello'] = 'world'
    trie['Cheese'] = 'awesome'
    expect(trie['Cheese']).to eql('awesome')
    expect(trie['Hello']).to eql('world')
    expect(trie['hello']).to be_nil
  end

  it 'will do wildcard matching properly' do
    trie = Collections::Trie.new
    trie["Hello"] = 'world'
    trie["Hillo"] = 'spelling'
    trie["Hella"] = 'word'
    trie["Hell"] = 'should not get this one'
    results = trie.match('H*ll*')
    expect(results).to include('Hello', 'Hillo', 'Hella')
    expect(results.count).to eql(3)
  end
end
