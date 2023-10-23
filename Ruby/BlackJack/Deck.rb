require "./Card"

class Deck
  MARK = ["♦︎","❤︎","♠︎","♣︎"]
  CARD_NUM = 13
  def initialize()
    @cards = Array.new(0)
    CARD_NUM.times do |num|
      MARK.each do |mark|
        @cards.push(Card.new(num+1,mark))
      end
    end
  end
  def getDeckInfo
    return @cards
  end
end

# deck = Deck.new()
# p deck.getDeckInfo()