# frozen_string_literal: true

require "./Player"
require "./CPU"
require "./Dealer"
require "./Deck"

class Game
  def initialize
    @player = Player.new("Player")
    @dealer = Dealer.new("Dealer")
    @users = [@player, @dealer]
    @deck = Deck.new()
    @cpuNum = 0
  end

  def startGame
    puts "CPUを何人追加しますか?(0~3を入力してください)"
    loop do
      @cpuNum = gets.to_i
      case @cpuNum
      when 0..3
        break
      else
        puts "0または1または2または3を入力してください"
      end
    end
    @cpuNum.times do |i|
      @users.insert(i + 1, CPU.new("CPU#{i + 1}"))
    end
    self.loopGame()
  end

private
  def loopGame
    loop do
      # カードを引く
      @users.each do |user|
        user.drawFirstCard(@deck, 2)
        if user.is_a?(Player) && user.splithand.length > 0
          user.drawSplitCard(@deck)
        end
        user.drawLoopCard(@deck)
        puts "#{user.name}の現在のポイント : #{user.point}"
        puts ""
      end

      # 勝敗決定
      @users[0..-2].each do |user|
        comparePoint(user, @dealer)
        if user.is_a?(Player) && user.splithand.length > 0
          compareSplitPoint(user, @dealer)
        end
        puts ""
      end

      # ゲームを終了
      self.finishGame

      # User情報クリア
      @users.each do |user|
        user.clearUser
      end
    end
  end

  def comparePoint(user, dealer)
    if user.is_a?(Player) && user.surrenderFlg
      puts "#{user.name}はサレンダーしました。"
      puts "現在の所持金:#{user.money}"
    elsif dealer.bustFlg || (!user.bustFlg && user.point >= dealer.point)
      puts "#{user.name}の勝ちです"
      self.finishMoney(user) if user.is_a?(Player)
    else
      puts "#{user.name}の負けです"
    end

    if user.is_a?(Player) && user.money == 0
      puts "#{user.name}の所持金が0円になったため、Gameを終了します"
      exit
    end
  end

  def finishGame
    puts "ゲームを終了しますか?yまたはnを入力してください"
    loop do
      flg = gets.chomp
      if flg == "y"
        puts "ゲームを終了します"
        exit
      elsif flg == "n"
        break
      else
        puts "yまたはnを入力してください"
      end
    end
  end

  def compareSplitPoint(user, dealer)
    puts "スプリットカードの勝敗"
    if dealer.bustFlg || (!user.splitbustFlg && user.splitPoint >= dealer.point)
      puts "#{user.name}の勝ちです"
      self.finishMoney(user) if user.is_a?(Player)
    else
      puts "#{user.name}の負けです"
    end
  end

  def finishMoney(user)
    user.money += (user.bet * 2)
    puts "現在の所持金:#{user.money}"
  end
end

game = Game.new()
game.startGame()
