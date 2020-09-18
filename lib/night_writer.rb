require './lib/braille_converter'

file_in = ARGV[0]
file_out = ARGV[1]

input_file_content = File.read(file_in).chomp

braille_converter = BrailleConverter.new(input_file_content)
converted_braille = braille_converter.convert_to_braille
final_braille = braille_converter.format_braille(converted_braille)

File.open(file_out, 'w') { |file| file.write(final_braille) }

puts "Created '#{file_out}' containing #{input_file_content.length} characters."
