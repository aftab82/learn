module Printable
  def self.included(klass)
    attr_accessor :print_count
  end

  def print(item)
    @print_count ||= 0
    @print_count += 1
    "#{item} has been successfully printed. Print Count: #{@print_count}"
  end
end

class Terminal
  include Printable
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

terminal1 = Terminal.new("Term1")
p terminal1.print("Page")
p terminal1.print("Picture")

terminal2 = Terminal.new("Term2")
p terminal2.print("Page")
p terminal2.print("Picture")
