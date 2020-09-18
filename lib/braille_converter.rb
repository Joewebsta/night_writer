require './lib/braille_char'

class BrailleConverter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert_to_braille
    letters = text.chars
    braille_chars = letters.map { |letter| BrailleChar.new(letter).convert_letter_to_braille }
    rows_array = [[], [], []]

    braille_chars.each_with_object(rows_array) do |char, array|
      array[0] << char[0]
      array[1] << char[1]
      array[2] << char[2]
    end
  end

  def format_braille(braille_row_arr)
    row1 = braille_row_arr[0].join
    row2 = braille_row_arr[1].join
    row3 = braille_row_arr[2].join
    output = []

    until row1.length.zero?
      output << row1.slice!(0..79) + "\n"
      output << row2.slice!(0..79) + "\n"
      output << row3.slice!(0..79) + "\n"
    end

    output.join
  end
end
