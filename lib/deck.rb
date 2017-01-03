class Deck
    attr_reader :cards
  def initialize(deck)
    @cards = deck
  end

  def count
    @cards.count
  end

end
