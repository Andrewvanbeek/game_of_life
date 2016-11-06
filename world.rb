require_relative "cell"
class World
  attr_accessor :planet
  def initialize
    @planet = Array.new(4, Array.new(4){Cell.new})
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

  def live_or_die(cell)
    kill_off = ""
    if cell.status == "alive"
      kill_off = alive_to_dead?(cell)
    else
      kill_off = dead_stay_dead?(cell)
    end
    kill_the_cell(kill_off, cell)
  end

  def finding_alive_neighbors(cell)
    how_many_alive = give_neighbors(cell)
    how_many_alive.delete(nil)
    how_many_alive = how_many_alive.find_all {|cell| cell.status == "alive"}
  end

  def alive_to_dead?(cell)
    how_many_alive = finding_alive_neighbors(cell)
    how_many_alive.length > 3 || how_many_alive.length < 2
  end

  def dead_stay_dead?(cell)
    how_many_alive = finding_alive_neighbors(cell)
    how_many_alive.length != 3
  end

  def kill_the_cell(boolean, cell)
    if boolean
      cell.die
    else
      cell.live
    end
  end

  def generational_life_cycle
    planet.each do |plane|
      plane.each do |cell|
        live_or_die(cell)
      end
    end
  end

  def give_neighbors(cell)
    row, column = cell.position
    if row == 0 && column == 0
      neighbors = [planet[row, column + 1],
      planet[row + 1, column], planet[row + 1, column + 1]
      ].flatten
    elsif row == 0
      neighbors = [ planet[row, column - 1], planet[row, column + 1],
        planet[row + 1, column - 1], planet[row + 1, column], planet[row + 1, column + 1]
      ].flatten
    elsif column == 0
      neighbors = [planet[row - 1, column], planet[row - 1, column + 1],
      planet[row, column + 1],
      planet[row + 1, column], planet[row + 1, column + 1]
      ].flatten
    else
      neighbors = [planet[row - 1, column - 1], planet[row - 1, column], planet[row - 1, column + 1],
      planet[row, column - 1], planet[row, column + 1],
      planet[row + 1, column - 1], planet[row + 1, column], planet[row + 1, column + 1]
      ].flatten
    end

  end

  def expand_world
    planet << Array.new(planet.length){Cell.new}
    planet.each do |plane|
      plane << Cell.new
    end
    give_cells_positions
  end

  def board_display_form
    print_planet = []
    planet.each do |plane|
      print_planet << plane.map {|cell| cell.display}
    end
    print_planet
  end

  def populations_counts
    population_count = []
    planet.each do |plane|
      population_count << plane.find_all {|cell| cell.status == "alive"}
    end
    alive = population_count.reduce(0) {|sum, alive_cells| sum + alive_cells.length}
    "alive cells are: #{alive}"
  end
end

















