require './lib/braille_converter'
require './lib/braille_char'

describe BrailleConverter do
  subject { BrailleConverter.new(text.to_s) }

  describe '#init' do
    let(:text) { 'a' }

    it 'is an instance of BrailleConverter' do
      is_expected.to be_a BrailleConverter
    end

    it 'has text' do
      expect(subject.text).to eql('a')
    end
  end

  describe 'convert' do
    context 'when a lowercase character' do
      let(:text) { 'a' }

      it 'returns braille' do
        expect(subject.convert).to eql("0.\n..\n..")
      end
    end

    context 'when two lowercase characters' do
      let(:text) { 'ab' }

      it 'returns braille' do
        expect(subject.convert).to eql("0.0.\n..0.\n....")
      end
    end

    context 'when an uppercase character' do
      let(:text) { 'A' }

      skip it 'returns braille' do
        expect(subject.convert).to eql("0.0.\n..0.\n....")
      end
    end

    context 'when two uppercase characters' do
      let(:text) { 'AB' }

      skip it 'returns braille' do
        expect(subject.convert).to eql("0.0.\n..0.\n....")
      end
    end

    context '80 positions wide' do
      let(:text) { 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' }

      it 'returns braille' do
        braille =
          "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n" \
          "................................................................................\n" \
          '................................................................................'

        expect(subject.convert).to eql(braille)
      end
    end

    context '82 positions wide' do
      let(:text) { 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' }

      skip it 'returns braille' do
        braille =
          "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n" \
          "................................................................................\n" \
          '................................................................................'

        expect(subject.convert).to eql(braille)
      end
    end

    context 'all characters' do
      let(:text) { " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" }

      skip it 'returns braille' do
        braille = ''
        expect(subject.convert).to eql(braille)
      end
    end
  end
end
