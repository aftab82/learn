module Printable
  def print(item)
    "#{item} has been successfully printed."
  end
end

class Terminal
  include Printable
end

terminal = Terminal.new
p terminal.print("screen")
