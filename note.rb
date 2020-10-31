# if Gem.win_platform?
#   Encoding.default_external = Encoding.find(Encoding.locale_charmap)
#   Encoding.default_internal = __ENCODING__
#   [STDIN, STDOUT].each do |io|
#     io.set_encoding(Encoding.default_external, Encoding.default_internal)
#   end
# end

require_relative "lib/post"
require_relative "lib/link"
require_relative "lib/memo.rb"
require_relative "lib/task.rb"

puts "Привет, я твой блокнот!"
puts "Что хотите записать в блокнот?"

choises = Post.post_types

choise = -1

until choise >= 0 && choise < choises.size

  choises.each_with_index do |item, index|
    puts "\t#{index}. #{item}"
  end

  choise = STDIN.gets.to_i
end

entry = Post.create(choise)

entry.read_from_console

entry.save

puts "Запись сохранена."
