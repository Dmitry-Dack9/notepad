require "date"

class Task < Post
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts "Что нужно сделать?"
    @text = STDIN.gets.chomp

    puts "К какой дате, Укажите ее в формате ДД.ММ.ГГГГ, например, 24.05.2016"
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    deadline = "Крайний срок: #{@due_date}"

    return [deadline, @text, time_string]
  end

  def to_db_hash
    return super.merge(
                   {
                      "text" => @text,
                      "due_date" => @due_date
                   }
    )
  end

  # Метод load_data у Задачи считывает дополнительно due_date задачи
  def load_data(data_hash)
    # родительский метод load_data для общих полей.
    super

    # достаю из хэша специфичное только для задачи значение due_date
    @due_date = Date.parse(data_hash['due_date'])
  end
end
