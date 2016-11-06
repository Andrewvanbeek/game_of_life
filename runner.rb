require_relative "world"
require_relative "world_viewer"
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

world = World.new
world.give_cells_positions
i = 0
while i < 5
reset_screen
world.generational_life_cycle
Worldviewer.print_world(world.board_display_form)
p world.populations_counts
sleep(2)
world.expand_world
end
