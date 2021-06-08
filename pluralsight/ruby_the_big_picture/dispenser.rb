class Dispenser

  def initialize()
    refill(5)
  end

  def refill(liters)
    @liters = liters
  end

  def dispense()
    if @liters > 0
      @liters -= 1
      return "#{@liters} liters of water remaining."
    else
      return "Out of water. Please refill."
    end
  end

end
