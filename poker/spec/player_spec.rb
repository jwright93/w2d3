require 'player'


describe Player do
  subject (:player) { Player.new('someone', 100)}
  let(:hand) { [1, 2, 3, 4, 5] }

  describe '#initialize' do

    it 'sets the instance variable name' do
      expect(player.name).to eq('someone')
    end

    it 'sets the instance variable pot' do
      expect(player.pot).to eq(100)
    end

    it 'sets instance variable hand to be empty' do
      expect(player.hand.class).to be(Hand)
    end

  end

  describe '#discard' do

    it 'removes selected cards from hand' do
      player.discard(2)
    end

    it 'returns the number of cards discarded'

  end


end
