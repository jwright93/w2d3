require 'hand'
require 'card'

describe Hand do
  let(:empty_hand) { Hand.new }

  describe '#initialize' do

    it 'sets a instance variable cards to empty array' do
      expect(empty_hand.cards).to be_empty
    end

  end

  describe '#add_card' do

    it 'add passed in card to cards' do
      empty_hand.add_card(Card.new(:A, :spade))
      expect(empty_hand.cards.first.class).to be(Card)
    end

    context 'hand is full' do

      it 'raises an error' do
        5.times { empty_hand.add_card(Card.new(:A, :spade)) }
        expect do
           empty_hand.add_card(Card.new(:A, :spade))
         end.to raise_error("Hand is full")
      end

    end

  end

  describe '#discard' do
    it 'discards passed cards' do
      discarded_card = Card.new(:A,:spades)
      empty_hand.add_card(Card.new(:A,:hearts))
      empty_hand.add_card(discarded_card)
      empty_hand.add_card(Card.new(:J,:spades))
      empty_hand.add_card(Card.new(:J,:hearts))
      empty_hand.add_card(Card.new(2,:spades))

      empty_hand.discard(discarded_card)

      expect(empty_hand.cards).not_to include(discarded_card)
    end
  end

  describe '#evaluate' do

    it 'evaluates for one pair' do
      empty_hand.add_card(Card.new(:A,:hearts))
      empty_hand.add_card(Card.new(:A,:spades))
      empty_hand.add_card(Card.new(:J,:spades))
      empty_hand.add_card(Card.new(8,:spades))
      empty_hand.add_card(Card.new(2,:spades))

      expect(empty_hand.evaluate).to eq(:pair)

    end

    it 'evaluates for two pair' do
      empty_hand.add_card(Card.new(:A,:hearts))
      empty_hand.add_card(Card.new(:A,:spades))
      empty_hand.add_card(Card.new(:J,:spades))
      empty_hand.add_card(Card.new(:J,:hearts))
      empty_hand.add_card(Card.new(2,:spades))

      expect(empty_hand.evaluate).to eq(:two_pair)
    end

    it 'evaluates for three of a kind' do
      empty_hand.add_card(Card.new(:A,:hearts))
      empty_hand.add_card(Card.new(:A,:spades))
      empty_hand.add_card(Card.new(:A,:diamonds))
      empty_hand.add_card(Card.new(8,:spades))
      empty_hand.add_card(Card.new(2,:spades))

      expect(empty_hand.evaluate).to eq(:three_of_a_kind)
    end

    it 'evaluates for full house' do
      empty_hand.add_card(Card.new(:A,:hearts))
      empty_hand.add_card(Card.new(:A,:spades))
      empty_hand.add_card(Card.new(:J,:spades))
      empty_hand.add_card(Card.new(:J,:diamonds))
      empty_hand.add_card(Card.new(:J,:hearts))

      expect(empty_hand.evaluate).to eq(:full_house)
    end

    it 'evaluates for four of a kind' do
      empty_hand.add_card(Card.new(:A,:hearts))
      empty_hand.add_card(Card.new(:A,:spades))
      empty_hand.add_card(Card.new(:J,:spades))
      empty_hand.add_card(Card.new(:A,:diamonds))
      empty_hand.add_card(Card.new(:A,:clubs))

      expect(empty_hand.evaluate).to eq(:four_of_a_kind)
    end

    it 'evaluates for a flush' do
      empty_hand.add_card(Card.new(:Q,:spades))
      empty_hand.add_card(Card.new(:A,:spades))
      empty_hand.add_card(Card.new(:J,:spades))
      empty_hand.add_card(Card.new(8,:spades))
      empty_hand.add_card(Card.new(2,:spades))

      expect(empty_hand.evaluate).to eq(:flush)
    end

    it 'evaluates for straight' do
      empty_hand.add_card(Card.new(:A,:hearts))
      empty_hand.add_card(Card.new(:K,:spades))
      empty_hand.add_card(Card.new(:Q,:spades))
      empty_hand.add_card(Card.new(:J,:spades))
      empty_hand.add_card(Card.new(10,:spades))

      expect(empty_hand.evaluate).to eq(:straight)
    end

    it 'evaluates for straight flush' do
      empty_hand.add_card(Card.new(:A,:spades))
      empty_hand.add_card(Card.new(:K,:spades))
      empty_hand.add_card(Card.new(:Q,:spades))
      empty_hand.add_card(Card.new(:J,:spades))
      empty_hand.add_card(Card.new(10,:spades))

      expect(empty_hand.evaluate).to eq(:straight_flush)
    end

  end

end
