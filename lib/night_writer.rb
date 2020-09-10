file_names = {
  input: ARGV[0],
  output: ARGV[1]
}

output_file_name = file_names[:output]

input_file_content = File.open(file_names[:input]).read

File.open(file_names[:output], 'w') { |file| file.write(input_file_content) }

puts "Created '#{output_file_name}'' containing #{input_file_content.length} characters."
