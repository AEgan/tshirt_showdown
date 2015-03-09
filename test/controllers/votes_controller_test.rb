require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  before do
    @vote = FactoryGirl.create(:vote)
    sign_in @vote.user
  end

  it "creates a vote" do
    assert_difference('Vote.count') do
      post :create, submission_id: @vote.submission
    end

    assert_redirected_to showdown_path(@vote.submission.showdown_id,assigns(:showdown))
  end

  after do
    sign_out @vote.user
  end

end
