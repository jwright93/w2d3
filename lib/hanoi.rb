class Hanoi
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end



  def move(from_tower, to_tower)
    raise 'No such tower!' unless in_range?(from_tower) || in_range?(to_tower)

    ft = @towers[from_tower]
    tt = @towers[to_tower]

    raise 'No block' if ft.empty?
    raise 'Invalid move' if !tt.last.nil? && ft.last > tt.last

    piece = @towers[from_tower].pop
    @towers[to_tower] << piece
  end

  def in_range?(num)
    (0..2).include?(num)
  end

  def won?
    return true if towers[1] == [3, 2, 1] || towers[2] == [3, 2, 1]
    false
  end

end
