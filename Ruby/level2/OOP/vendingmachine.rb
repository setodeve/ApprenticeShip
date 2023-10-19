class VendingMachine
  def initialize(s)
    @str = s
    @money = 0
  end
  
  def deposit_coin(m)
    if m==100
      @money = m
    end
  end

  def press_button
    if(@money>=100) 
      return "cider"
    end
  end

  private
    def press_manufacturer_name
      return @str
    end
end

vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_button

vending_machine.deposit_coin(150)
puts vending_machine.press_button

vending_machine.deposit_coin(100)
puts vending_machine.press_button

puts vending_machine.press_manufacturer_name