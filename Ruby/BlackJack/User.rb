# frozen_string_literal: true

require "./Card"
# frozen_string_literal: true

class User
  attr_accessor(:hand, :point, :name, :bustFlg)
  def initialize(name)
    @hand = Array.new(0)
    @point = 0
    @name = name
    @bustFlg = false
  end

  def drawCard(deck, number)
    @hand.concat(deck.draw(number))
    self.calculate()
    self.isBust()
  end

  def drawFirstCard(deck, number)
    self.drawCard(deck, number)
    self.showAllCard
  end

  def drawLoopCard(deck)
    loop do
      if self.point >= 17
        break
      else
        self.drawCard(deck, 1)
      end
    end
  end

  def clearUser
    @hand = Array.new(0)
    @point = 0
    @bustFlg = false
  end

private
  def showAllCard
    @hand.each do |card|
      puts "#{@name}が引いたカードは#{card.mark}#{card.num}です。"
    end
    puts "#{@name}の現在のポイントは#{@point}です。"
  end

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

  def isBust
    if @point >= 22
      puts "#{self.name}バーストしました。"
      @bustFlg = true
    end
  end
end
