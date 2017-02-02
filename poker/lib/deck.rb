require 'card'

class Deck
  attr_reader :cards
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
  SUITS = [:spades, :hearts, :clubs, :diamonds]

  def initialize
    @cards = populate
    @cards.shuffle!
  end

  def deal
    cards.pop
  end

  private

  def shuffle!
    cards.shuffle!
  end

  def populate
    result = []

    SUITS.each do |suit|
      VALUES.each do |value|
        result << Card.new(value, suit)
      end
    end

    result
  end



end
