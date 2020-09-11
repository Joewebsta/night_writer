require './lib/braille_char'

describe BrailleChar do
  subject { BrailleChar.new(text.to_s) }

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
      dictionary_hash =
        {
          'a' => '0.....',
          'b' => '0.0...',
          'c' => '00....',
          'd' => '00.0..',
          'e' => '0..0..',
          'f' => '000...',
          'g' => '0000..',
          'h' => '0.00..',
          'i' => '.00...',
          'j' => '.000..',
          'k' => '0...0.',
          'l' => '0.0.0.',
          'm' => '00..0.',
          'n' => '00.00.',
          'o' => '0..00.',
          'p' => '000.0.',
          'q' => '00000.',
          'r' => '0.000.',
          's' => '.00.0.',
          't' => '.0000.',
          'u' => '0...00',
          'v' => '0.0.00',
          'w' => '.000.0',
          'x' => '00..00',
          'y' => '00.000',
          'z' => '..0.00',
          '!' => '..000.',
          "'" => '....0.',
          ',' => '..0...',
          '-' => '....00',
          '.' => '..00.0',
          '?' => '...000',
          ' ' => '......'
          # '#' => ".0000.",
          # '0' => ".000..",
          # '1' => "0.....",
          # '2' => "0.0...",
          # '3' => "00....",
          # '4' => "00.0..",
          # '5' => "0..0..",
          # '6' => "000...",
          # '7' => "0000..",
          # '8' => "0.00..",
          # '9' => ".00..."
        }
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

    context 'when a special character' do
      let(:text) { '!' }

      it 'converts to braille' do
        expect(subject.convert).to eql('..000.')
      end
    end
  end

  describe '#uppercase?' do
    context 'when an uppercase letter' do
      let(:text) { 'G' }

      it 'returns true' do
        expect(subject.uppercase?).to be true
      end
    end

    context 'when a lowercase letter' do
      let(:text) { 'l' }

      it 'returns false' do
        expect(subject.uppercase?).to be false
      end
    end
  end
end
