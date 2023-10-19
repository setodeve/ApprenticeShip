class VendingMachine
  def initialize(s)
    @str = s
    @money = 0
    @cup = 0
  end
  
  def deposit_coin(m)
    if m==100
      @money += m
    end
  end

  def press_button(s)
    if((s.is_a?(Drink) or s.is_a?(Snack)) and @money>=s.item_value_return()) 
      @money -= s.item_value_return()
      return s.item_return()
    elsif(s.is_a?(Cup) and @cup>=1)
      @cup-=1
      return "#{s.item_return()} cup coffee"
    end
  end

  def add_cup(n)
    @cup += n
  end
  
  private
    def press_manufacturer_name
      return @str
    end
end

class Item 
  def item_return 
    return @item
  end

  def item_value_return 
    return @value
  end
end

class Drink < Item
  def initialize(s)
    if('cola'==s)
      @value = 150
    else
      @value = 100
    end
    @item = s
  end
end

class Cup < Item
  def initialize(s)
    @value = 100
    @item = s
  end
end

class Snack < Item
    def initialize
      @value = 150
      @item = "potato chips"
    end
end

hot_cup_coffee = Cup.new('hot');
cider = Drink.new('cider')
snack = Snack.new
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)

puts vending_machine.press_button(snack)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(snack)