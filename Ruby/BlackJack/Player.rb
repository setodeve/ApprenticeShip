# frozen_string_literal: true

require "./User"
# frozen_string_literal: true

class Player < User
  attr_accessor(:splithand, :splitPoint, :money, :bet, :splitbet, :doubledownFlg, :surrenderFlg, :splitbustFlg)
  def initialize (name)
    super(name)
    @splithand = Array.new(0)
    @splitPoint = 0
    @money = 1000
    @bet = 0
    @splitbet = 0
    @doubledownFlg = false
    @surrenderFlg = false
    @splitbustFlg = false
  end

  def drawFirstCard(deck, number)
    self.betMoney
    self.drawCard(deck, number)
    self.showAllCard
    self.doubleDownCard(deck)
    if !@doubledownFlg
      self.surrender
      self.splitCard
    end
  end

  def drawSplitCard(deck)
    @splithand.concat(deck.draw(1))
    self.calculateSplit()
    self.isSplitBust()
  end

  def drawLoopCard(deck)
    loop do
      break if (@surrenderFlg || @doubledownFlg)
      puts "#{@name}の現在のポイントは#{@point}です。カードを引きますか？"
      puts "yまたはnを入力してください"
      flg = gets.chomp
      if flg == "y"
        self.drawCard(deck, 1)
      elsif flg == "n"
        break
      else
        puts "yまたはnを入力してください"
      end
    end
  end

  def clearUser
    @hand = Array.new(0)
    @point = 0
    @bustFlg = false
    @splithand = Array.new(0)
    @splitPoint = 0
    @bet = 0
    @splitbet = 0
    @surrenderFlg = false
    @splitbustFlg = false
  end

private
  def calculateSplit
    count = 0
    @splitPoint = 0

    @splithand.map { |card|
      if card.num == :A
        count += 1
      end
      @splitPoint += Card::NUM[card.num]
    }
    # Aを11として加算して問題ない場合加算
    if ((10 * count) + @splitPoint) <= 21
      @splitPoint += 10 * count
    end
  end

  def isSplitBust
    if @splitPoint >= 22
      puts "#{self.name}バーストしました。"
      @splitbustFlg = true
    end
  end

  def betMoney
    loop do
      puts "いくらベットしますか。現在の所持金:#{@money}"
      input = gets.to_i
      if @money >= input
        @bet += input
        @money -= input
        puts "#{@bet}をベットします。現在の所持金:#{@money}"
        break
      else
        puts "所持金以内のベット額を入力してください"
      end
    end
  end

  def splitCard
    if @hand[0].num == @hand[1].num
      puts "スプリットしますか? yまたはnを入力してください"
      loop do
        flg = gets.chomp
        if flg == "y"
          @splithand = @hand.pop()
          puts "いくらベットしますか。現在の所持金:#{@money}"
          input = gets.to_i
          if @money >= input
            @splitbet = input
            @money -= input
            puts "#{@bet}をベットします。現在の所持金:#{@money}"
            break
          else
            puts "所持金以内のベット額を入力してください"
          end
        elsif flg == "n"
          break
        else
          puts "yまたはnを入力してください"
        end
      end
    end
  end

  def doubleDownCard(deck)
    loop do
      puts "ダブルダウンしますか？yまたはnを入力してください"
      key = gets.chomp
      if key == "y"
        if @money >= @bet
          @doubledownFlg = true
          @money -= @bet
          @bet += @bet
          puts "#{@bet}をベットします。現在の所持金:#{@money}"
          self.drawCard(deck, 1)
          break
        else
          puts "所持金を超えるベットのためダブルダウンできません。"
        end
      elsif key == "n"
        break
      else
        puts "yまたはnを入力してください"
      end
    end
  end

  def surrender
    loop do
      puts "サレンダーしますか？yまたはnを入力してください"
      key = gets.chomp
      if key == "y"
        @money += ((@bet / 2).round)
        @surrenderFlg = true
        break
      elsif key == "n"
        break
      else
        puts "yまたはnを入力してください"
      end
    end
  end
end
