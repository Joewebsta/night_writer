require './lib/braille_converter'

file_names = {
  input: ARGV[0],
  output: ARGV[1]
}

output_file_name = file_names[:output]

input_file_content = File.open(file_names[:input]).read
braille_converter = BrailleConverter.new(input_file_content)
converted_braille = braille_converter.convert_to_braille
final_braille = braille_converter.format_braille(converted_braille)
File.open(file_names[:output], 'w') { |file| file.write(final_braille) }

puts "Created '#{output_file_name}' containing #{input_file_content.length} characters."
