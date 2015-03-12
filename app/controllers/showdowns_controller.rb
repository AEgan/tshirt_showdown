class ShowdownsController < ApplicationController

  before_action :set_showdown, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @showdowns = Showdown.all
  end


  def show
    @has_voted = Showdown.get_current_user_votes(@showdown.id, current_user.id).any?
    unless @showdown.over?
      render :show
    else
      @winning_submission = @showdown.get_winner
      render template: 'showdowns/showdown_expired'
    end
  end


  def new
    @showdown = Showdown.new
  end

  def edit
  end

  def create
    @showdown = Showdown.new(showdown_params)
    @showdown.user = current_user
    respond_to do |format|
      if @showdown.save
        format.html { redirect_to @showdown, notice: 'Showdown was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @showdown.update(showdown_params)
        format.html { redirect_to @showdown, notice: 'Showdown was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @showdown.destroy
    respond_to do |format|
      format.html { redirect_to showdowns_url, notice: 'Showdown was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showdown
      @showdown = Showdown.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showdown_params
      params.require(:showdown).permit(:theme, :winning_submission, :end_date, :closed)
    end
end
