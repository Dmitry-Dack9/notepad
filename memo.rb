class Memo < Post
  def read_from_console
    puts "Новая заметка (все, что пишете до строчки \"end\"):"

    @text = []
    line = nil

    while line != "end" do
      line = STDIN.gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    return @text.unshift(time_string)
  end

  def to_db_hash
    # Вызываем родительский метод to_db_hash ключевым словом super. К хэшу,
    # который он вернул добавляем специфичные для этого класса поля методом
    # Hash#merge. Массив строк делаем одной большой строкой, разделенной
    # символами перевода строки.
    super.merge('text' => @text.join('\n'))
  end

  def load_data(data_hash)
    super

    # Теперь достаю из хэша специфичное только для задачи значение text
    @text = data_hash['text'].split('\n')
  end
end
