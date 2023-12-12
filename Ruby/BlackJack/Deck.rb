# frozen_string_literal: true

require "./Card"
# frozen_string_literal: true

class Deck < Card
  attr_accessor(:deck)
  def initialize
    @deck = Array.new(0)
    generate()
  end

  def draw(time)
    cards = Array.new(0)
    time.times do |i|
      cards << @deck.pop()
    end
    cards
  end

private
  def shuffle
    1.upto(1000) do |n|
      r1 = rand(0..51)
      r2 = rand(0..51)
      @deck[r1], @deck[r2] = @deck[r2], @deck[r1]
    end
  end

  def generate
    NUM.keys.each do |num|
      MARK.each do |mark|
        @deck.push(Card.new(num, mark))
      end
    end
    shuffle()
  end
end
