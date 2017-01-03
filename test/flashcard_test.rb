require "./bin/test_suite.rb"
require "./lib/card"
require "./lib/guess"
require "./lib/deck"
require "./lib/round"

class FlashcardTest < MiniTest::Test

  def test_new_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

  def test_new_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.card.answer
    assert_equal "Juneau", guess.response
    assert guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_card_new_inputs
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Mercury", guess.card.answer
    assert_equal "Saturn", guess.response
    refute guess.correct?
    assert_equal "Incorrect!", guess.feedback
  end

  def test_new_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
    assert_equal 3, deck.count
  end

  def test_new_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [card_1, card_2], round.deck.cards
    assert_equal [], round.guesses
    assert_equal "93,000,000", round.current_card.answer
    round.record_guess("Juneau")
    assert_equal "Juneau", round.guesses[0].guess
    assert_equal 1, round.guesses.count
    assert_equal "Correct!",round.guesses.first.feedback
    assert_equal 1, round.number_correct
    # round.current_card
    # => #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">
    # round.record_guess("2")
    # => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
    # round.guesses.count
    # => 2
    # round.guesses.last.feedback
    # => "Incorrect."
    # round.number_correct
    # => 1
    # round.percent_correct
    # => 50
  end

end
