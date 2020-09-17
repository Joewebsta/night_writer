require './lib/braille_converter'

file_names = {
  input: ARGV[0],
  output: ARGV[1]
}

output_file_name = file_names[:output]

input_file_content = File.open(file_names[:input]).read
braille = BrailleConverter.new(input_file_content).convert_to_braille

File.open(file_names[:output], 'w') { |file| file.write(braille) }

puts "Created '#{output_file_name}' containing #{input_file_content.length} characters."
