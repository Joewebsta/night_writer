require './lib/braille_char'

describe BrailleChar do
  subject { BrailleChar.new("#{text}") }

  describe '#init' do
    let(:text) { 'a' }
    
    it 'is an instance of BrailleChar' do
      is_expected.to be_a BrailleChar
    end

    it 'has a letter' do
      expect(subject.letter).to eql('a')
    end
  end

  describe '#dictionary' do
    let(:text) { 'a' }

    it 'returns a hash of english and braille letters' do
      dictionary_hash = { 'a' => '0.....', 'b' => '0.0...', 'c' => "00\n..\n..", 'd' => "00\n.0\n..", 'e' => "0.\n.0\n..", 'f' => "00\n0.\n..", 'g' => "00\n00\n..", 'h' => "0.\n00\n..", 'i' => ".0\n0.\n..", 'j' => ".0\n00\n..", 'k' => "0.\n..\n0.", 'l' => "0.\n0.\n0.", 'm' => "00\n..\n0.", 'n' => "00\n.0\n0.", 'o' => "0.\n.0\n0.", 'p' => "00\n0.\n0.", 'q' => "00\n00\n0.", 'r' => "0.\n00\n0.", 's' => ".0\n0.\n0.", 't' => ".0\n00\n0.", 'u' => "0.\n..\n00", 'v' => "0.\n0.\n00", 'w' => ".0\n00\n.0", 'x' => "00\n..\n00", 'y' => "00\n.0\n00", 'z' => "..\n0.\n00", '!' => "..\n00\n0.", "'" => "..\n..\n0.", ',' => "..\n0.\n..", '-' => "..\n..\n00", '.' => "..\n00\n.0", '?' => "..\n.0\n00", ' ' => "..\n..\n.." }
      expect(subject.dictionary).to eql(dictionary_hash)
    end
  end

  describe '#convert' do
    context 'when a lower case letter' do
      let(:text) { 'a' }
      it 'converts to braille' do
        expect(subject.convert).to eql('0.....')
      end
    end

    context 'a special character' do
      let(:text) { '!' }

      it 'converts to braille' do
        expect(subject.convert).to eql("..\n00\n0.")
      end
    end
  end
end
