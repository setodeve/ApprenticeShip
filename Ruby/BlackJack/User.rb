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

  def serUserCard(drawedcard)
    @cardonhand.push(drawedcard)
  end

  def serUserPoint(point)
    @point += point
  end
end
