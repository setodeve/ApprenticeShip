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
  end

  def setUserPoint(point)
    @point += point
  end

  def calculate
    @cardonhand.map { |c| setUserPoint(c[0].getConstantCardNumber[c[0].getCardNumber]) }
  end
end
