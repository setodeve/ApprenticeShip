class Card
  def initialize(n,s)
    @num = n
    @mark = s
  end

  def getCardInfo 
    return [@num, @mark]
  end
end
