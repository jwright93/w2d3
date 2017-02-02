require 'deck'

describe Deck do
  subject(:deck) { Deck.new }


  describe '#initialize' do

    it 'sets an instance variable cards with length 52' do
      expect(deck.cards.length).to eq(52)
    end

    it 'has 13 cards of each suit' do
      spades = 0
      hearts = 0
      diamonds = 0
      clubs = 0

      deck.cards.each do |card|
        case card.suit
        when :spades
          spades += 1
        when :hearts
          hearts += 1
        when :diamonds
          diamonds += 1
        when :clubs
          clubs += 1
        end
      end

      expect(spades).to eq(13)
      expect(hearts).to eq(13)
      expect(diamonds).to eq(13)
      expect(clubs).to eq(13)
    end
  end

  describe '#deal' do
      let(:card) { double('card') }

    it 'returns a card' do
      expect(deck.deal.class).to be(Card)
    end

    it 'removes dealt card from deck' do
      deck.deal
      expect(deck.cards.length).to eq(51)
    end

  end

end
