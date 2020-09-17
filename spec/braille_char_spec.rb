require './lib/braille_char'

describe BrailleChar do
  subject { BrailleChar.new(letter.to_s) }

  describe '#init' do
    let(:letter) { 'a' }

    it 'is an instance of BrailleChar' do
      is_expected.to be_a BrailleChar
    end

    it 'has a letter' do
      expect(subject.letter).to eql('a')
    end
  end

  describe '#dictionary' do
    let(:letter) { 'a' }

    it 'returns a hash of english and braille letters' do
      dictionary_hash =
        {
          'a' => ['0.', '..', '..'],
          'b' => ['0.', '0.', '..'],
          'c' => ['00', '..', '..'],
          'd' => ['00', '.0', '..'],
          'e' => ['0.', '.0', '..'],
          'f' => ['00', '0.', '..'],
          'g' => ['00', '00', '..'],
          'h' => ['0.', '00', '..'],
          'i' => ['.0', '0.', '..'],
          'j' => ['.0', '00', '..'],
          'k' => ['0.', '..', '0.'],
          'l' => ['0.', '0.', '0.'],
          'm' => ['00', '..', '0.'],
          'n' => ['00', '.0', '0.'],
          'o' => ['0.', '.0', '0.'],
          'p' => ['00', '0.', '0.'],
          'q' => ['00', '00', '0.'],
          'r' => ['0.', '00', '0.'],
          's' => ['.0', '0.', '0.'],
          't' => ['.0', '00', '0.'],
          'u' => ['0.', '..', '00'],
          'v' => ['0.', '0.', '00'],
          'w' => ['.0', '00', '.0'],
          'x' => ['00', '..', '00'],
          'y' => ['00', '.0', '00'],
          'z' => ['0.', '.0', '00'],
          '!' => ['..', '00', '0.'],
          "'" => ['..', '..', '0.'],
          ',' => ['..', '0.', '..'],
          '-' => ['..', '..', '00'],
          '.' => ['..', '00', '.0'],
          '?' => ['..', '0.', '00'],
          ' ' => ['..', '..', '..'],
          'capital_shift' => ['..', '..', '.0']
        }
      expect(subject.dictionary).to eql(dictionary_hash)
    end
  end

  describe '#convert_letter_to_braille' do
    context 'when a lower case letter' do
      let(:letter) { 'a' }
      it 'converts to braille' do
        expect(subject.convert_letter_to_braille).to eql(['0.', '..', '..'])
      end
    end

    context 'when an uppercase letter' do
      let(:letter) { 'A' }

      it 'converts to braille' do
        expect(subject.convert_letter_to_braille).to eql([['..', '..', '.0'], ['0.', '..', '..']])
      end
    end

    context 'when another single uppercase letter' do
      let(:letter) { 'Z' }

      it 'returns braille' do
        expect(subject.convert_letter_to_braille).to eql([['..', '..', '.0'], ['0.', '.0', '00']])
      end
    end

    context 'when a special character' do
      let(:letter) { '!' }

      it 'converts to braille' do
        expect(subject.convert_letter_to_braille).to eql(['..', '00', '0.'])
      end
    end
  end

  describe '#convert_uppercase' do
    context 'when a single uppercase letter' do
      let(:letter) { 'A' }

      it 'returns braille' do
        expect(subject.convert_uppercase).to eql([['..', '..', '.0'], ['0.', '..', '..']])
      end
    end

    context 'when another single uppercase letter' do
      let(:letter) { 'Z' }

      it 'returns braille' do
        expect(subject.convert_uppercase).to eql([['..', '..', '.0'], ['0.', '.0', '00']])
      end
    end
  end

  describe '#uppercase?' do
    context 'when an uppercase letter' do
      let(:letter) { 'G' }

      it 'returns true' do
        expect(subject.uppercase?).to be true
      end
    end

    context 'when a lowercase letter' do
      let(:letter) { 'l' }

      it 'returns false' do
        expect(subject.uppercase?).to be false
      end
    end
  end
end
