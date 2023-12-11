# frozen_string_literal: true

require "./User"
# frozen_string_literal: true

class Player < User
  attr_accessor(:splithand, :money, :bet, :splitbet)
  def initialize (name)
    super(name)
    @splithand = Array.new(0)
    @money = 1000
    @bet = 0
    @splitbet = 0
  end

  def drawFirstCard(deck, number)
    self.drawCard(deck, number)
    self.showAllCard
  end

  def isBust
    if @point >= 22
      puts "#{self.name}バーストしました。"
      return true
    end
    false
  end

private
  def showAllCard
    @hand.each do |card|
      puts "#{self.name}が引いたカードは#{card.mark}#{card.num}です。"
    end
  end


  # def drawloop(menu, deck)
  #   loop do
  #     menu.showPlayerPoint(self.getUserPoint)
  #     key = gets.chomp
  #     if key == "Y"
  #       drawCard(menu, deck, 1)
  #       break if @overflg
  #     elsif key == "N"
  #       break
  #     else
  #       menu.showCheckYesorNo()
  #     end
  #   end
  # end

  # def drawCard(menu, deck, number)
  #   card = deck.draw(number)
  #   self.setUserCard(card)
  #   menu.showDrawCard(true, card[0].getCardNumber, card[0].getCardMark)
  #   self.checklineover(menu)
  # end

  # def surrender(menu)
  #   loop do
  #     menu.surrenderGame
  #     key = gets.chomp
  #     if key == "Y"
  #       self.setplusmoney((self.getbet / 2).round)
  #       setSurrenderFlg(true)
  #       break
  #     elsif key == "N"
  #       break
  #     else
  #       menu.showCheckYesorNo
  #     end
  #   end
  # end

  # def bet
  #   money = self.getmoney
  #   loop do
  #     puts "いくらベットしますか。現在の所持金:#{money}"
  #     input = gets.to_i
  #     if money >= input
  #       puts "#{input}をベットします"
  #       self.setbet(input)
  #       self.setminusmoney(input)
  #       break
  #     else
  #       puts "所持金以内のベット額を入力してください"
  #     end
  #   end
  # end

  # def winGame
  #   self.setplusmoney(self.getbet * 2)
  #   puts "現在の所持金:#{self.getmoney}"
  # end
end
