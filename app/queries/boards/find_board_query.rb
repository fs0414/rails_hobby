class Boards::FindBoardQuery
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def run
    Board.find(id[:id])
  end
end
