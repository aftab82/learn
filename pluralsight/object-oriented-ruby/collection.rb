class Collection
  @search_count = 0
  attr_reader :name

  def initialize(name)
    @name = name
    @books = []
  end

  def [](index)
    @books[index]
  end

  def []=(index, book)
    @books[index] = book
  end

  def <<(book)
    @books << book
  end

  def !
    @books.empty?
  end

  def <=>(other)
    name <=> other.name
  end

  def ==(other)
    id == other.id
  end

  def eql?(other)
    self == other
  end

  def self.find
    @search_count += 1
  end

  def self.search_count
    @search_count
  end

  log_time :find_by_author
  log_time :custom_sort

  def self.log_time(method)
    alias_method "_original_#{method}".to_sym, method

    define_method(method) {
      |*args, &block|
      start_time = Time.now

      puts "Calling #{method} with args #{args.inspect} #{'and a block' if block}"
      result = __send__ "_original_#{method}".to_sym, *args, &block

      end_time = Time.now - start_time
      puts "Call to #{method} with args #{args.inspect} took #{end_time}s"
      result
    }
  end

  def display(format)
    puts "== #{@name} =="
    puts "Showing books in a #{format} view"
  end
  protected
  attr_reader :id
end

class Series < Collection
  @search_count = 0

  def display(format)
    puts "Series description"
    super
  end
end

class CuratedCollection < Collection
  def initialize(name, genre)
    super(name)
    @genre = genre
  end

  def display(format, show_description:)
    @genre.display() if show_description
    super(format)
  end
end
