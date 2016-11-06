class Cell
  attr_accessor :position, :status
  def initialize
    @status = ["dead", "alive"].sample
    @position = "not placed yet"
  end

  def die
    @status = "dead"
  end

  def display
    if self.status == "dead"
      "[ ]"
    elsif self.status == "alive"
      "(0.0)"
    end
  end

  def get_position(row_column)
    self.position = row_column
  end

  def live
    self.status = "alive"
  end
end

