require './lib/braille_converter'
require './lib/braille_char'

describe BrailleConverter do
  subject { BrailleConverter.new('a') }

  describe '#init' do
    it 'is an instance of BrailleConverter' do
      is_expected.to be_a BrailleConverter
    end

    it 'has text' do
      expect(subject.text).to eql('a')
    end
  end

  describe 'convert' do
    it 'returns braille' do
      expect(subject.convert).to eql("0.\n..\n..")
    end
  end
end