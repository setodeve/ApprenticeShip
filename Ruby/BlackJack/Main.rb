# frozen_string_literal: true

require "./Deck"
require "./Menu"
require "./Player"
require "./Dealer"
# frozen_string_literal: true

class Main
end

main = Main.new()
menu = Menu.new()
deck = Deck.new()
deck.shuffle()
player1 = Player.new()
dealer = Dealer.new()