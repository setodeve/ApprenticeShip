# frozen_string_literal: true

require "./Card"
# frozen_string_literal: true

class Deck
  MARK = ["♦︎", "❤︎", "♠︎", "♣︎"]
  CARD_NUM = 13
  def initialize
    @deck = Array.new(0)
    CARD_NUM.times do |num|
      MARK.each do |mark|
        @deck.push(Card.new(num + 1, mark))
      end
    end
  end
  def getDeckInfo
    @deck
  end

  def shuffle
  end

  def draw
  end
end
