# frozen_string_literal: true

require "./User"
# frozen_string_literal: true

class Player < User
  def drawloop(menu, deck)
    loop do
      menu.showPlayerPoint(self.getUserPoint)
      key = gets.chomp
      if key == "Y"
        drawCard(menu, deck, 1)
      elsif key == "N"
        break
      else
        menu.showCheckYesorNo()
      end
    end
    self.checklineover(menu, false)
  end

  def drawCard(menu, deck, number)
    card = deck.draw(number)
    self.setUserCard(card)
    menu.showDrawCard(true, card[0].getCardNumber, card[0].getCardMark)
  end
end
