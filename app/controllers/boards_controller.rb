class BoardsController < ApplicationController
  before_action :set_board, only: [:show]

  NUMBER_OF_BOARDS = 10

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.limit(NUMBER_OF_BOARDS)
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    User.transaction do
      user = User.create!(ip: request.remote_ip)
      @board.items[rand(@board.items_count)].stickers.create!(user: user, x: rand(500), y: rand(500))
    end
  end

  # GET /boards/new
  def new
    @board = Board.new
    @board.items.build([{title: '', position: 0}, {title: '', position: 1}])
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title, items_attributes: [:title, :position])
    end
end
