class ShowdownsController < ApplicationController
  before_action :set_showdown, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /showdowns
  # GET /showdowns.json
  def index
    @showdowns = Showdown.all
  end

  # GET /showdowns/1
  # GET /showdowns/1.json
  def show
  end

  # GET /showdowns/new
  def new
    @showdown = Showdown.new
  end

  # GET /showdowns/1/edit
  def edit
  end

  # POST /showdowns
  # POST /showdowns.json
  def create
    @showdown = Showdown.new(showdown_params)
    @showdown.user = current_user
    respond_to do |format|
      if @showdown.save
        format.html { redirect_to @showdown, notice: 'Showdown was successfully created.' }
        format.json { render :show, status: :created, location: @showdown }
      else
        format.html { render :new }
        format.json { render json: @showdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showdowns/1
  # PATCH/PUT /showdowns/1.json
  def update
    respond_to do |format|
      if @showdown.update(showdown_params)
        format.html { redirect_to @showdown, notice: 'Showdown was successfully updated.' }
        format.json { render :show, status: :ok, location: @showdown }
      else
        format.html { render :edit }
        format.json { render json: @showdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showdowns/1
  # DELETE /showdowns/1.json
  def destroy
    @showdown.destroy
    respond_to do |format|
      format.html { redirect_to showdowns_url, notice: 'Showdown was successfully destroyed.' }
      format.json { head :no_content }
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
