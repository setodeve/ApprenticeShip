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
      if c[0].getCardNumber != :A
        count += 1
      end
      setUserPoint(c[0].getConstantCardNumber[c[0].getCardNumber])
    }
    # Aが含まれていて11として加算して問題ない場合加算
    if count >= 1 && @point < 11 && @point > 22
      setUserPoint(10 * count)
    end
  end
end
