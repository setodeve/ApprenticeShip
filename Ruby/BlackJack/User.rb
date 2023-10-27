require "./module/UserCommon"
# frozen_string_literal: true

class User
  include UserCommon
  def initialize
    @cardonhand = Array.new(0)
    @point = 0
    @money = 1000
    @bet = 0
    @overflg = false
    @surrenderflg = false
  end

  def setUserCard(drawedcard)
    @cardonhand.push(drawedcard)
    calculate()
  end

  def calculate
    count = 0
    clearUserPoint()

    @cardonhand.map { |c|
      if c[0].getCardNumber == :A
        count += 1
      end
      setUserPoint(c[0].getConstantCardNumber[c[0].getCardNumber])
    }
    # Aを11として加算して問題ない場合加算
    if ((10 * count) + @point) <= 21
      setUserPoint(10 * count)
    end
  end

  def drawloop(deck)
    loop do
      if self.getUserPoint >= 17
        break
      else
        card = deck.draw(1)
        self.setUserCard(card)
      end
    end
  end

  def drawtwice(menu, deck)
    2.times do
      self.drawCard(menu, deck, 1)
    end
  end

  def drawCard(menu, deck, number)
    card = deck.draw(number)
    self.setUserCard(card)
  end

  def checklineover(menu)
    if self.getUserPoint >= 22
      setOverFlg(true)
      menu.showOverPoint
      # menu.showJudgeEndGame(false, self)
    end
  end
end
