class Comments::CreateCommentForm
  attr_reader :current_user, :content, :board

  def initialize(current_user:, content:, board:)
    @current_user = current_user
    @content = content
    @board = board
  end

  def run
    board.comments.create!(
      content: content,
      user_id: current_user.id
    )
  end
end
