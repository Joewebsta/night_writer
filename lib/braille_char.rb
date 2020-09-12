class BrailleChar
  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

  def convert
    uppercase? ? convert_uppercase : dictionary[letter]
  end

  def convert_uppercase
    lowcase_letter = letter.downcase
    row1 = '..' + dictionary[lowcase_letter][0..1]
    row2 = '..' + dictionary[lowcase_letter][2..3]
    row3 = '.0' + dictionary[lowcase_letter][4..5]
    "#{row1}#{row2}#{row3}"
  end

  def uppercase?
    letter =~ /[A-Z]/ ? true : false
  end

  def dictionary
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
      'z' => '0..000',
      '!' => '..000.',
      "'" => '....0.',
      ',' => '..0...',
      '-' => '....00',
      '.' => '..00.0',
      '?' => '..0.00',
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
  end
end
