require_relative "cell"

class Worldtwo
  attr_reader :planet
  def initialize
    @planet = Array.new(4, Array.new(4){Cell.new})
    give_cells_positions
  end

  def give_cells_positions
    planet.each do |plane|
      row = planet.index(plane)
      plane.each do |cell|
        column = plane.index(cell)
        cell.get_position([row, column])
      end
    end
  end

end

world = Worldtwo.new

p world.planet
