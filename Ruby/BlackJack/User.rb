# frozen_string_literal: true

class User
  def initialize
    @cardonhand = Array.new(0)
    @point = 0
  end

  def getUserCard
    @cardonhand
  end

  def getUserPoint
    @point
  end

  def setUserCard(drawedcard)
    @cardonhand.push(drawedcard)
    calculate()
  end

  def setUserPoint(point)
    @point += point
  end

  def clearUserPoint
    @point = 0
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

  def drawCard(menu, deck, number)
    card = deck.draw(number)
    self.setUserCard(card)
    menu.showDrawCard(true, card[0].getCardNumber, card[0].getCardMark)
  end

  def checklineover(menu, flg)
    if self.getUserPoint >= 22
      menu.showJudgeEndGame(flg)
    end
    menu.showPoint(self)
  end
end
