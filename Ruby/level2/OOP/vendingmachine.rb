class VendingMachine
  def initialize(s)
    @str = s
    @money = 0
  end
  
  def deposit_coin(m)
    if m==100
      @money += m
    end
  end

  def press_button(s)
    if(@money>=s.drink_value_return()) 
      return s.drink_return()
    end
  end

  private
    def press_manufacturer_name
      return @str
    end
end

class DrinkList 
  def initialize(s)
    if('cola'==s)
      @value = 150
    else
      @value = 100
    end
    @drink = s
  end

  def drink_return 
    return @drink
  end

  def drink_value_return 
    return @value
  end
end

cola = DrinkList.new('cola')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)