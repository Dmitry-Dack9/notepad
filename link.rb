class Link < Post
  def initialize
    super

    @url = ""
  end

  def read_from_console
    puts "Адрес ссылки?"
    @url = STDIN.gets.chomp

    puts "Введите описание ссылки:"
    @text = STDIN.gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    return [@url, @text, time_string]
  end

  def to_db_hash
    super.merge('text' => @text, 'url' => @url)
  end

  def load_data(data_hash)
    super

    # Теперь достаем из хэша специфичное только для ссылки значение url
    @url = data_hash['url']
  end
end
