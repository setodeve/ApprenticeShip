# frozen_string_literal: true

require "./User"
# frozen_string_literal: true

class Dealer < User
  def drawCard(menu, deck, number)
    card = deck.draw(number)
    self.setUserCard(card)
    if self.getUserCard.length() <= 1
      menu.showDrawCard(false, card[0].getCardNumber, card[0].getCardMark)
    else
      menu.showDealerDraw2ndCard()
    end
  end
end
