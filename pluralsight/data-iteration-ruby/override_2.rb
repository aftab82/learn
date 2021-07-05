module Printable
  def print(item)
    "#{item} has been successfully printed."
  end
end

class Terminal
  include Printable
  def print(item)
    "#{item} has been successfully printed to the console"
  end
end

terminal = Terminal.new
p terminal.print("screen")
