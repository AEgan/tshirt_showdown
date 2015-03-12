class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_showdown


  def show
  end

  def new
    @submission = Submission.new
    @showdown = Showdown.find(params[:showdown_id])
  end

  def edit

  end

  def create
    @submission = Submission.new()
    @submission.assign_attributes(
        composite_id: Submission.extract_composite_id(submission_params[:composite_id]),
        user: current_user,
        showdown_id: params[:showdown_id]
      )
    respond_to do |format|
      if @submission.save
        format.html { redirect_to [@showdown, @submission], notice: 'Submission was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      submission_params[:composite_id] = Submission.extract_composite_id(submission_params[:composite_id]) 
      #submission_params[:total_votes] = @submission.votes +
      if @submission.update(submission_params)
        format.html { redirect_to [@showdown, @submission], notice: 'Submission was successfully updated.'}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to showdown_path(@showdown), notice: 'Submission was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def set_showdown
      @showdown = Showdown.find(params[:showdown_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:composite_id, :user_id, :showdown_id)
    end
end
