class Boards::CreateBoardForm
  attr_reader :current_user, :content

  def initialize(props)
    @content = props[:content]
    @current_user = props[:current_user]
  end

  def run
    current_user.boards.create!(content: content)
  end
end
