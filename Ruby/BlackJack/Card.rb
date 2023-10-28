# frozen_string_literal: true

class Card
  MARK = ["♦︎", "❤︎", "♠︎", "♣︎"]
  CARD_NUM = { "A": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10, "J": 10, "Q": 10, "K": 10 }
  def initialize(n, s)
    @num = n
    @mark = s
  end

  def getCardInfo
    [@num, @mark]
  end

  def getCardNumber
    @num
  end

  def getCardMark
    @mark
  end

  def getConstantCardNumber
    CARD_NUM
  end
end
