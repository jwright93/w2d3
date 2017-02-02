require 'hanoi'
require 'byebug'

describe Hanoi do
  subject(:hanoi) { Hanoi.new }

  describe '#initialize' do

    it 'sets an instance variable towers to correct initial setup' do
      expect(hanoi.towers).to eq([[3, 2, 1], [], []])
    end

  end

  describe '#move' do

      it 'moves top piece to new tower' do
        hanoi.move(0,1)
        expect(hanoi.towers).to eq( [[3,2], [1], []] )
      end

    context 'invalid move' do

      it 'raises an error if from_tower is an empty array' do
        expect { hanoi.move(1, 0) }.to raise_error('No block')
      end

      it 'raises an error if from_tower is larger than to_tower' do
        hanoi.move(0,1)
        expect {hanoi.move(0,1)}.to raise_error("Invalid move")
      end

      it 'raises an error for invalid tower number' do
        expect { hanoi.move(5,1000) }.to raise_error('No such tower!')
      end

      it 'raises an error if user inputs a string' do
        expect { hanoi.move(5,'a') }.to raise_error('No such tower!')
      end

    end

  end

  describe '#won?' do

    it 'returns false if game is not won' do
      expect(hanoi.won?).to be(false)
    end

    it 'returns true if game is won' do
      hanoi.move(0, 1)
      hanoi.move(0, 2)
      hanoi.move(1, 2)
      hanoi.move(0, 1)
      hanoi.move(2, 0)
      hanoi.move(2, 1)
      hanoi.move(0, 1)
      expect(hanoi.won?).to be(true)
    end


  end

end
