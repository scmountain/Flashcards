require "./lib/round"
class Guess
  attr_reader :guess, :card
    def initialize(guess, card)
      @card = card
      @guess = guess
    end

    def response
      @guess
    end

    def correct?
      @guess == @card.answer
    end

    def feedback
      if correct?
        "Correct!"
        
      else
        "Incorrect!"
      end

    end


end
