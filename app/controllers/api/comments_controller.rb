class Api::CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]

  def create
    board = Boards::FindBoardQuery.new(
      id: params[:board_id]
    ).run

    comment = Comments::CreateCommentForm.new(
      current_user: current_user,
      content: comment_params[:content],
      board: board
    ).run

    render json: comment
  end

  def destroy
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
