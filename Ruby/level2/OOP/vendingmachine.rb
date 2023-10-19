class VendingMachine
  def initialize(s)
    @str = s
  end
  def press_manufacturer_name
    return @str
  end
  def press_button
    return "cider"
  end
end

vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_manufacturer_name