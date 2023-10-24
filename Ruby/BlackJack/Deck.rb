# frozen_string_literal: true

require "./Card"
# frozen_string_literal: true

class Deck
  MARK = ["♦︎", "❤︎", "♠︎", "♣︎"]
  CARD_NUM = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
  def initialize
    @deck = Array.new(0)
    CARD_NUM.each do |num|
      MARK.each do |mark|
        @deck.push(Card.new(num, mark))
      end
    end
  end
  def getDeckInfo
    @deck
  end

  def shuffle
    1.upto(1000) do |n|
      r1 = rand(0..51)
      r2 = rand(0..51)
      @deck[r1], @deck[r2] = @deck[r2], @deck[r1]
    end
  end

  def draw(time)
    cards = Array.new(0)
    time.times do
      cards.push(@deck.pop())
    end
    cards
  end
end
# deck = Deck.new()
# p deck.getDeckInfo()
# deck.shuffle()
# p deck.draw(2)
# p deck.getDeckInfo()
