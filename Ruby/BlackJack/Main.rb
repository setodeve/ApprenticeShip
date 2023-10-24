# frozen_string_literal: true

require "./Deck"
require "./Menu"
require "./Player"
require "./Dealer"

def main
  menu = Menu.new()
  deck = Deck.new()
  player1 = Player.new()
  dealer = Dealer.new()

  deck.shuffle()

  # Playerのカードドロー
  card = deck.draw(1)
  player1.setUserCard(card)
  menu.showDrawCard(true, card[0].getCardNumber, card[0].getCardMark)
  card = deck.draw(1)
  player1.setUserCard(card)
  menu.showDrawCard(true, card[0].getCardNumber, card[0].getCardMark)

  # dealerのカードカードドロー
  card = deck.draw(1)
  dealer.setUserCard(card)
  menu.showDrawCard(false, card[0].getCardNumber, card[0].getCardMark)
  card = deck.draw(1)
  dealer.setUserCard(card)
  menu.showDealerDraw2ndCard()

  # Playerが複数回カードドロー
  loop do
    menu.showPlayerPoint(player1.getUserPoint)
    key = gets.chomp
    if key == "Y"
      card = deck.draw(1)
      player1.setUserCard(card)
      menu.showDrawCard(true, card[0].getCardNumber, card[0].getCardMark)
    elsif key == "N"
      break
    else
      menu.showCheckYesorNo()
    end
  end

  # Playerのポイントが21を超えた場合
  if player1.getUserPoint >= 22
    menu.showJudgeEndGame(false)
  end

  menu.showPoint(false, dealer.getUserPoint)
  # dealerが複数回カードドロー
  loop do
    if dealer.getUserPoint >= 17
      break
    else
      card = deck.draw(1)
      dealer.setUserCard(card)
    end
  end

  # dealerのポイントが21を超えた場合
  if dealer.getUserPoint >= 22
    menu.showJudgeEndGame(true)
  end

  menu.showPoint(true, player1.getUserPoint)
  menu.showPoint(false, dealer.getUserPoint)

  if player1.getUserPoint >= dealer.getUserPoint
    menu.showJudgeEndGame(true)
  else
    menu.showJudgeEndGame(false)
  end
end

main
