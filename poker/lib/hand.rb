
class Hand
  attr_reader :cards

  def initialize
      @cards = []
  end

  def add_card(card)
    raise 'Hand is full' if cards.length > 4
    cards << card
  end

  def evaluate
    straight_flush || collect_pairs || straight || flush
  end

  def discard(card)
      cards.delete(card)
  end


  private
  def collect_pairs
    pairs = Hash.new { 0 }

    cards.each do |card|
      pairs[card.value] += 1
    end

    values = pairs.values
    case
    when values.include?(2) && values.include?(3)
      :full_house
    when values.count(2) == 2
      :two_pair
    when values.include?(2)
      :pair
    when values.include?(3)
      :three_of_a_kind
    when values.include?(4)
      :four_of_a_kind
    end

  end

  def straight
    order = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]

    results = []
    cards.each do |card|
      results << order.find_index(card.value)
    end

    results.sort!

    results.each_with_index do |el, idx|

      if results[idx + 1].nil?
        return :straight
      end

      return false unless el + 1 == results[idx + 1]
    end
  end

  def flush
    pairs = Hash.new { 0 }

    cards.each do |card|
      pairs[card.suit] += 1
    end

    return :flush if pairs.values.include?(5)

  end

  def straight_flush
    :straight_flush if straight == :straight && flush == :flush
  end



end
