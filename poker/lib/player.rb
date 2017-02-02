require 'hand'

class Player
  attr_accessor :hand
  attr_reader :pot, :name

  def initialize(name, pot)
    @name = name
    @pot = pot
    @hand = Hand.new
  end

end
