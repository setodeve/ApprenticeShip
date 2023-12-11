# frozen_string_literal: true

require "./Player"
require "./AI"
require "./Dealer"
require "./Deck"

class Game
  def initialize
    # @player = Player.new("Player")
    @players = [Player.new("Player"),Dealer.new("Dealer")]
    # @dealer = Dealer.new("Dealer")
    @playernumber = 0
    @deck = Deck.new()
  end

  def startGame
    puts "CPUを何人追加しますか?(0~3を入力してください)"
    loop do
      @playernumber = gets.to_i
      case @playernumber
      when 0..3
        break
      else
        puts "0または1または2または3を入力してください"
      end
    end
    @playernumber.times do |i|
      @players.insert(i+1,AI.new("AI#{i + 1}"))
    end
    self.loopGame()
  end

  def loopGame
    loop do
      # 各userが最初のカードを2枚引く。
      @players.each do |user|
        user.drawFirstCard(@deck, 2)
        puts user.point
      end
      break
    end
  end

  def endGame(player)
    flgBust = player.isBust()

    if flgBust
      return true
    end
    false
  end
end

game = Game.new()
game.startGame()
