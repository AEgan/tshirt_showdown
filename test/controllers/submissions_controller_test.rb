require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  before do
    @submission = FactoryGirl.create(:submission)
    sign_in @submission.user
  end

  it "gets new" do
    get :new, showdown_id: @submission.showdown_id
    assert_response :success
  end

  it "creates submission" do
    stub_request(:get, "http://www.customink.com/design/retrieve.json?email=&filename=").
      with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => { 'compositeId': @submission.composite_id }.to_json, :headers => {})

    assert_difference('Submission.count') do
      post :create, showdown_id: @submission.showdown, submission: { composite_id: @submission.composite_id,
                                  user_id: @submission.user_id,
                                  showdown_id: @submission.showdown_id }
    end

    assert_redirected_to showdown_submission_path(@submission.showdown_id, assigns(:submission))
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
    patch :update, submission: {  composite_id: @submission.composite_id,
                                  user_id: @submission.user_id,
                                  showdown_id: @submission.showdown_id },
                                  showdown_id: @submission.showdown_id,
                                  id: @submission.id
    assert_redirected_to showdown_submission_path(@submission.showdown_id, assigns(:submission))
  end

  it "destroys submission" do
    assert_difference('Submission.count', -1) do
      delete :destroy, id: @submission, showdown_id: @submission.showdown_id
    end

    assert_redirected_to showdown_path(@submission.showdown)
  end

  after do
    sign_out @submission.user
  end

end
