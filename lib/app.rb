require_relative 'page_list'

file_path = 'data/webserver.log'

list = PageList.new(file_path)

puts 'Welcome to the webserver log app. Please select one of the two options (press 1 or 2)'
puts '1. Show all page views'
puts '2. Show only unique page views'
print '>'
answer = gets.chomp.to_i
case answer
when 1
  puts list.print_all
when 2
  puts list.print_unique
else
  puts 'Please provide a valid input (1 or 2)'
end
