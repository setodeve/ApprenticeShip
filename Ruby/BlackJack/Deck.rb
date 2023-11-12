# frozen_string_literal: true

require "./Card"
# frozen_string_literal: true

class Deck < Card
  def initialize
    @deck = Array.new(0)
    generate()
  end

  def generate
    CARD_NUM.keys.each do |num|
      MARK.each do |mark|
        @deck.push(Card.new(num, mark))
      end
    end
    shuffle()
  end

  def initializeDeck
    @deck = Array.new(0)
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
