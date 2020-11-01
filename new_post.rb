# if Gem.win_platform?
#   Encoding.default_external = Encoding.find(Encoding.locale_charmap)
#   Encoding.default_internal = __ENCODING__
#   [STDIN, STDOUT].each do |io|
#     io.set_encoding(Encoding.default_external, Encoding.default_internal)
#   end
# end

require_relative "post"
require_relative "link"
require_relative "memo"
require_relative "task"

puts "Привет, я твой блокнот! Версия 2 + Sqlite"
puts "Что хотите записать в блокнот?"

choises = Post.post_types.keys

choise = -1

until choise >= 0 && choise < choises.size

  choises.each_with_index do |item, index|
    puts "\t#{index}. #{item}"
  end

  choise = STDIN.gets.to_i
end

entry = Post.create(choises[choise])

entry.read_from_console

id = entry.save_to_db

puts "Запись сохранена, id = #{id}"
