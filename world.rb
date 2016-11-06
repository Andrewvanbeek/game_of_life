require_relative "cell"
require "pry"

class World
  attr_accessor :planet
  def initialize
    @planet = [Array.new(4){Cell.new}, Array.new(4){Cell.new}, Array.new(4){Cell.new}, Array.new(4){Cell.new}]
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
    kill_the_cell(kill_off)
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

  def kill_the_cell(boolean)
    cell = Cell.new
    if boolean
      cell.die
    else
      cell.live
    end
    cell
  end

  def generational_life_cycle
    planet_next_gen = []
    self.planet.each do |plane|
        new_plane = []
      plane.each do |cell|
        new_plane << live_or_die(cell)
      end
    planet_next_gen << new_plane
    end
    self.planet = planet_next_gen
  end

  def give_neighbors(cell)
    row, column = cell.position
    if row == 0 && column == 0
      neighbors = planet[row][column + 1],
      planet[row + 1][column], planet[row + 1][column + 1]
    elsif row == 3 && column == 3
      neighbors = planet[row - 1][column - 1], planet[row - 1][column],
      planet[row][column - 1]
    elsif row == planet.length - 1
      neighbors = planet[row - 1][column - 1], planet[row - 1][column], planet[row - 1][column + 1],
      planet[row][column - 1], planet[row][column + 1]
    elsif column == planet.length - 1
      neighbors = planet[row - 1][column - 1], planet[row - 1][column],
      planet[row][column - 1], planet[row + 1][column]
    elsif row == 0
      neighbors = planet[row][column - 1], planet[row][column + 1],
        planet[row + 1][column - 1], planet[row + 1][column], planet[row + 1][column + 1]
    elsif column == 0
      neighbors = planet[row - 1][column], planet[row - 1][column + 1],
      planet[row][column + 1],
      planet[row + 1][column], planet[row + 1][column + 1]
    else
      neighbors = planet[row - 1][column - 1], planet[row - 1][column], planet[row - 1][column + 1],
      planet[row][column - 1], planet[row][column + 1],
      planet[row + 1][column - 1], planet[row + 1][column], planet[row + 1][column + 1]
    end
    neighbors
  end

  def expand_world
    planet << Array.new(planet.length){Cell.new}
    planet.each do |plane|
      plane << Cell.new
    end
    give_cells_positions
  end

  def board_display
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
    def populations_check
    population_count = []
    planet.each do |plane|
      population_count << plane.find_all {|cell| cell.status == "alive"}
    end
    alive = population_count.reduce(0) {|sum, alive_cells| sum + alive_cells.length}
  end
end

















