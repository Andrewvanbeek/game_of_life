class Worldviewer
  def self.print_world(world)
    world.each do |plane|
      p plane.join("")
    end
  end
end
