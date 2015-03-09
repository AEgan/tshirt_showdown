class VotesController < ApplicationController

  def create
    @vote = Vote.new()
    @vote.assign_attributes( user: current_user, submission_id: params[:submission_id])
    respond_to do |format|
      if @vote.save!
        format.html { redirect_to showdown_path(@vote.submission.showdown), notice: 'Thanks for voting!' }
      else 
        format.html { redirect_to showdown_path(@vote.submission.showdown), notice: 'Could not cast vote' }
      end
    end
  end

end
