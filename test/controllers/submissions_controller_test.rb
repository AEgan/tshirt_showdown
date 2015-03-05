require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  before do
    @submission = FactoryGirl.create(:submission)
    sign_in @submission.user
  end

  it "gets index" do
    get :index, id: @submission, showdown_id: @submission.showdown_id
    assert_response :success
    assert_not_nil assigns(:submissions)
  end

  it "gets new" do
    get :new, showdown_id: @submission.showdown_id
    assert_response :success
  end

  it "creates submission" do
    assert_difference('Submission.count') do
      post :create, submission: { composite_id: @submission.composite_id, 
                                  user_id: @submission.user_id,
                                  showdown_id: @submission.showdown_id}
    end

    assert_redirected_to submission_path(assigns(:submission))
  end

  it "shows submission" do
    get :show, id: @submission, showdown_id: @submission.showdown_id
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: @submission, showdown_id: @submission.showdown_id
    assert_response :success
  end

  it "updates submission" do
    patch :update, id: @submission, submission: { composite_id: @submission.composite_id, 
                                                  user_id: @submission.user_id,
                                                  showdown_id: @submission.showdown_id },
                                    showdown_id: @submission.showdown_id
    assert_redirected_to submission_path(assigns(:submission))
  end

  it "destroys submission" do
    assert_difference('Submission.count', -1) do
      delete :destroy, id: @submission, showdown_id: @submission.showdown_id
    end

    assert_redirected_to submissions_path
  end

  after do
    sign_out @submission.user
  end

end
