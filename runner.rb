require_relative "world"
require_relative "world_viewer"
require "pry"
def reset_screen
  clear_screen
  move_to_home
end

# Clears the content on the screen. Ah, a fresh canvas.
def clear_screen
  print "\e[2J"
end

# Moves the insert point in the terminal back to the upper left.
def move_to_home
  print "\e[H"
end
i = 0
world = World.new
world.give_cells_positions
while i < 5
  world.board_display.each do |row|
  p row
 end
world.generational_life_cycle



 world.give_cells_positions
  world.board_display.each do |row|
  p row
end
world.expand_world
end