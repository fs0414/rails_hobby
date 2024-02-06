class Api::BoardsController < BaseController
  before_action :set_board, only: %i[update destroy]

  def index
    boards = Board.all

    render json: boards
  end

  def show
    board = Boards::FindBoardQuery.new(id: params[:id]).run

    render json: board
  end

  def create
    board = Boards::CreateBoardForm.new(
      current_user: current_user,
      content: board_params[:content]
    ).run

    render json: board
  end

  def update
    @board.update!(board_params)
  end

  def destroy
    @board.destroy!
  end

  private

  def board_params
    params.require(:board).permit(:content)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
