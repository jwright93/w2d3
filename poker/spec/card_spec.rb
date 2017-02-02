require 'card'


describe Card do
  subject(:ace_of_spades) { Card.new(:ace,:spades)}

  describe '#initialize' do

    it 'sets the instance variable value' do
      expect(ace_of_spades.value).to eq(:ace)
    end

    it 'sets the instance variable suit' do
      expect(ace_of_spades.suit).to eq(:spades)
    end

  end
end
