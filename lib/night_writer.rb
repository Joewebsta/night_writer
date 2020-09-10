file_names = { input: ARGV[0], output: ARGV[1] }

output_file_name = file_names[:output]

input_file = File.open(file_names[:input], 'r')
output_file = File.open(file_names[:output], 'w')

content = input_file.read.strip
output_file.write(content)
output_file.close

puts "Created '#{output_file_name}'' containing #{content.length} characters."
