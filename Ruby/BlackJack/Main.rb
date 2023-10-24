# frozen_string_literal: true

require "./Deck"
require "./Menu"
require "./Player"
require "./Dealer"

class Main
  def initialize
  end

  def drawCard(user, menu, deck, number)
    card = deck.draw(number)
    user.setUserCard(card)
    if user.instance_of?(Player) || (user.instance_of?(Dealer) && user.getUserCard.length() <= 1)
      menu.showDrawCard(user.instance_of?(Player), card[0].getCardNumber, card[0].getCardMark)
    else
      menu.showDealerDraw2ndCard()
    end
  end

  def drawloopPlayer(user, menu, deck)
    loop do
      menu.showPlayerPoint(user.getUserPoint)
      key = gets.chomp
      if key == "Y"
        drawCard(user, menu, deck, 1)
      elsif key == "N"
        break
      else
        menu.showCheckYesorNo()
      end
    end
  end

  def drawloopDealer(user, deck)
    loop do
      if user.getUserPoint >= 17
        break
      else
        card = deck.draw(1)
        user.setUserCard(card)
      end
    end
  end

  def checklineover(user, menu, flg)
    if user.getUserPoint >= 22
      menu.showJudgeEndGame(flg)
    end
  end

  def compareFinalNumber(player, dealer)
    player.getUserPoint >= dealer.getUserPoint
  end

  def main
    menu = Menu.new()
    deck = Deck.new()
    player1 = Player.new()
    dealer = Dealer.new()

    deck.shuffle()

    # Playerのカードドロー
    drawCard(player1, menu, deck, 1)
    drawCard(player1, menu, deck, 1)

    # dealerのカードカードドロー
    drawCard(dealer, menu, deck, 1)
    drawCard(dealer, menu, deck, 1)

    # Playerが複数回カードドロー
    drawloopPlayer(player1, menu, deck)

    # Playerのポイントが21を超えた場合
    checklineover(player1, menu, false)

    # dealerが複数回カードドロー
    menu.showPoint(dealer)
    drawloopDealer(dealer, deck)

    # dealerのポイントが21を超えた場合
    checklineover(dealer, menu, true)

    menu.showPoint(player1)
    menu.showPoint(dealer)
    compareFinalNumber(player1, dealer) ? menu.showJudgeEndGame(true) : menu.showJudgeEndGame(false)
  end
end

main = Main.new()
main.main()
