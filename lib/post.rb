class Post
  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console

  end

  def to_strings

  end

  def save
    file = File.new(file_path, "w:UTF-8")

    for item in string do
      file.puts(item)
    end
    file.close
  end

  def file_path
    current_path = __dir_

    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%m-%s.txt")

    return File.join(current_path, file_name)
  end
end
