class Round
  attr_reader :deck, :guesses, :response, :current_card
  def initialize(deck)
    @deck = deck
    @guesses = []
    @guess = nil
  end

  def current_card
    @current_card = draw_a_card
  end

  def draw_a_card
    @deck.cards.pop
    end

  def record_guess(guess)
    guess_holder = Guess.new(guess, current_card)
    @guesses << guess_holder
  end




end
