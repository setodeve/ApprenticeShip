# frozen_string_literal: true

class Card
  def initialize(n, s)
    @num = n
    @mark = s
  end

  def getCardInfo
    [@num, @mark]
  end
end
