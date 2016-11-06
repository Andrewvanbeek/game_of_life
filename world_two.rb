class World_two
    attr_accessor :planet
  def initialize
    @planet = [Array.new(4){Cell.new}, Array.new(4){Cell.new}, Array.new(4){Cell.new}, Array.new(4){Cell.new}]
    give_cells_positions
    start
  end


    def give_neighbors(cell)
    row, column = cell.position
    if row == 0
      neighbors = [ planet[row, column - 1], planet[row, column + 1],
        planet[row + 1, column - 1], planet[row + 1, column], planet[row + 1, column + 1]
      ].flatten
    else
      neighbors = [planet[row - 1, column - 1], planet[row - 1, column], planet[row - 1, column + 1],
        planet[row, column - 1], planet[row, column + 1],
        planet[row + 1, column - 1], planet[row + 1, column], planet[row + 1, column + 1]
      ].flatten
    end
  end

end