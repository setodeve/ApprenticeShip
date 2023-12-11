# frozen_string_literal: true

require "./User"
# frozen_string_literal: true

class Dealer < User
  def initialize (name)
    super(name)
  end

  def drawFirstCard(deck, number)
    self.drawCard(deck, number)
    self.showFirstCard
  end

private
  def showFirstCard
    puts "#{self.name}が引いたカードは#{@hand[0].mark}#{@hand[0].num}です。"
    puts "Dealerの2枚目のカードはわかりません。"
  end

  # def drawCard(menu, deck, number)
  #   card = deck.draw(number)
  #   self.setUserCard(card)
  #   if self.getUserCard.length() <= 1
  #     menu.showDrawCard(false, card[0].getCardNumber, card[0].getCardMark)
  #   else
  #     menu.showDealerDraw2ndCard()
  #   end
  # end
end
