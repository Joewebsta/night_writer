require './lib/braille_char'

class BrailleConverter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert_to_braille
    letters = text.chars
    braille_chars = letters.map { |letter| BrailleChar.new(letter).convert_letter_to_braille }
    rows_array = [[], "\n", [], "\n", []]

    braille_chars.each_with_object(rows_array) do |char, array|
      array[0] << char[0]
      array[2] << char[1]
      array[3] << char[2]
    end.join
  end
end
