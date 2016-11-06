class Cell
  attr_accessor :position
  attr_reader :status
  def initialize
    @status = ["dead", "alive"].sample
    @position = "not placed yet"
  end

  def die
    @status = "dead"
  end

  def display
    if self.status == "dead"
      "_"
    elsif self.status == "alive"
      "(0.0)"
    end
  end

  def get_position(row_column)
    self.position = row_column
  end

  def live
    @status = "alive"
  end
end

