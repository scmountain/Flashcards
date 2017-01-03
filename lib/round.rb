class Round
  attr_reader :deck, :guesses, :response, :count, :card_in_hand
  def initialize(deck)
    @deck = deck
    @guesses = []
    @count = 1
    @card_in_hand = nil
  end

  def current_card
    @deck.cards.each_entry do |card|
      @card_in_hand = card
    end
  end

  def record_guess(guess)
    @count += 1
    guess
  end

end
