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

class Printer
  include Printable
  def print(item)
    "#{item} has been successfully printed to the printer"
  end
end

class InkjetPrinter < Printer
  def print(item)
    "#{item} has been successfully printed to the inkjet printer"
  end
end

inkjet = InkjetPrinter.new
p InkjetPrinter.ancestors
p inkjet.print("Page")
