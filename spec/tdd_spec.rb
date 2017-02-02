require 'tdd'

describe 'tdd' do
  describe '#uniq' do
    subject(:array) {[1,2,1,3,3]}
    let(:array2) {[1,2,3]}

    it "returns [] if it is an empty array" do
      expect([].my_uniq).to be_empty
    end

    it "returns uniq array" do
      expect(array.my_uniq).to eq([1,2,3])
    end

    it "does not mutate the original array" do
      array.my_uniq
      expect(array).to eq([1,2,1,3,3])
    end

  end

  describe '#two_sum' do
    subject(:array) { [-1, 0, 2, -2, 1] }
    let(:array2) { [1, 1, -1] }
    let(:array3) { [1, -1, -1] }

    it 'returns [] if it is an empty array' do
      expect([].two_sum).to be_empty
    end

    it 'returns correct two_sum pairs' do
      expect(array.two_sum).to include([0, 4], [2, 3])
    end

    it 'returns correct pairs in order by smaller first element' do
      expect(array2.two_sum).to eq([[0, 2], [1, 2]])
    end

    it 'returns correct pairs in order by smaller second element' do
      expect(array3.two_sum).to eq([[0, 1], [0, 2]])
    end

  end

  describe '#my_transpose' do
    subject(:rows) {[[0,1,2],[3,4,5],[6,7,8]]}
    let(:cols) {[[0,3,6],[1,4,7],[2,5,8]]}

    it 'returns empty array if given an empty array' do
      expect([].my_transpose).to be_empty
    end

    it 'does not mutate the original array' do
      rows.my_transpose
      expect(rows).to eq([[0,1,2],[3,4,5],[6,7,8]])
    end

    it 'transforms the rows to be columns' do
      expect(rows.my_transpose).to eq(cols)
    end

    it 'transforms the columns to be rows' do
      expect(cols.my_transpose).to eq(rows)
    end


  end

  describe '#stock_picker' do
    subject(:stock) { [5, 6, 4, 10, 2, 4, 6, 6, 7] }
    let(:stock2) { [7,5,2] }
    let(:stock3) { [7] }
    let(:stock4) { [1,9,9] }

    it 'finds the most profitable pair of days' do
      expect(stock.stock_picker).to eq([2,3])
    end

    it 'raises an error if selling day is before buying day' do
      expect {stock2.stock_picker}.to raise_error('No profitable day')
    end

    it 'raises an error if not enough days to accumulate profit' do
      expect {stock3.stock_picker}.to raise_error('Not enough days')
    end

    it 'returns only one pair' do
      expect(stock4.stock_picker).to eq([0,2])
    end

  end
end
