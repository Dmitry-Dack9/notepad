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

    for item in to_strings do
      file.puts(item)
    end
    file.close
  end

  def file_path
    current_path = __dir__

    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

    return File.join(current_path, file_name)
  end

  def self.post_types
    [Memo, Link, Task]
  end

  def self.create(type_index)
    return post_types[type_index].new
  end
end
