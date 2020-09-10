require './lib/braille_char'

class BrailleConverter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert
    letters = text.chars
    braille_chars = letters.map { |letter| BrailleChar.new(letter).convert }
    row1 = braille_chars.map { |char| char[0..1] }.join
    row2 = braille_chars.map { |char| char[2..3] }.join
    row3 = braille_chars.map { |char| char[4..5] }.join

    output = "#{row1}\n#{row2}\n#{row3}"
  end
end

