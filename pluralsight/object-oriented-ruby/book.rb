class Book
  @@search_count = 0

  def initialize(title:, author:, pub_year:)
    @title = title
    @author = author
    @pub_year = pub_year
  end

  def cover_url=(url)
    self.small_cover = url + "-small.jpg"
    self.large_cover = url + "-large.jpg"
  end

  def author
    "#{@author.last_name}, #{@author.first_name}"
  end

  def author=(last_first_name)
    last_name, first_name = last_first_name.split(/\s*,\s*/)
    @author = Author.find(first_name, last_name)
  end

  def self.find(title)
    @@search_count += 1
    Book.new(title: "Code", author: "Ruby Red", pub_year: 2020)
  end

  def self.search_count
    @@search_count
  end

  attr_reader :title, :author, :pub_year
  attr_accessor :small_cover, :large_cover
end
