class VotesController < ApplicationController

  def create
    @vote = Vote.new()
    @vote.assign_attributes( user: current_user, submission_id: params[:submission_id])
    respond_to do |format|
      if @vote.save
        format.html { redirect_to showdown_path(params[:showdown_id]), notice: 'Vote was successfully created.' }
      else 
        format.html { redirect_to showdown_path(params[:showdown_id]), notice: 'Could not cast vote' }
      end
    end
  end

end
