require './lib/braille_char'

class BrailleConverter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert
    letters = text.chars
    braille_chars = letters.map { |letter| BrailleChar.new(letter).convert }
    row1 = generate_row(braille_chars, 0, 1)
    row2 = generate_row(braille_chars, 2, 3)
    row3 = generate_row(braille_chars, 4, 5)

    "#{row1}\n#{row2}\n#{row3}"
  end

  def generate_row(braille_chars, strt_idx, end_idx)
    braille_chars.map do |char|
      if char.length == 6
        char[strt_idx..end_idx]
      else
        new_strt_idx = strt_idx * 2
        new_end_idx = (strt_idx * 2) + 3
        char[new_strt_idx..new_end_idx]
      end
    end.join
  end
end
