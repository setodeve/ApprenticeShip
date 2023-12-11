# frozen_string_literal: true

require "./module/UserCommon"
require "./Card"
# frozen_string_literal: true

class User
  attr_accessor(:hand, :point, :name)
  include UserCommon
  def initialize(name)
    @hand = Array.new(0)
    @point = 0
    @name = name
  end

  def drawCard(deck, number)
    @hand.concat(deck.draw(number))
    self.calculate()
  end
  
private
  def calculate
    count = 0
    @point = 0

    @hand.map { |card|
      if card.num == :A
        count += 1
      end
      @point += Card::NUM[card.num]
    }
    # Aを11として加算して問題ない場合加算
    if ((10 * count) + @point) <= 21
      @point += 10 * count
    end
  end

  # def drawloop(deck)
  #   loop do
  #     if self.getUserPoint >= 17
  #       break
  #     else
  #       card = deck.draw(1)
  #       self.setUserCard(card)
  #     end
  #   end
  # end

  # def drawtwice(menu, deck)
  #   2.times do
  #     self.drawCard(menu, deck, 1)
  #   end
  # end

  # def drawCard(menu, deck, number)
  #   card = deck.draw(number)
  #   self.setUserCard(card)
  # end

  # def checklineover(menu)
  #   if self.getUserPoint >= 22
  #     setOverFlg(true)
  #     menu.showOverPoint
  #   end
  # end
end
