
require 'test_helper'

class ShowdownsControllerTest < ActionController::TestCase

  setup do
    @showdown = FactoryGirl.create(:showdown)  
  end

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:showdowns)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates showdown" do
    assert_difference('Showdown.count') do
      post :create, showdown: { end_date: @showdown.end_date, theme: @showdown.theme, winning_submission: @showdown.winning_submission }
    end

    assert_redirected_to showdown_path(assigns(:showdown))
  end

  it "shows showdown" do
    get :show, id: @showdown
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: @showdown
    assert_response :success
  end

  it "updates showdown" do
    patch :update, id: @showdown, showdown: { end_date: @showdown.end_date, theme: @showdown.theme, winning_submission: @showdown.winning_submission }
    assert_redirected_to showdown_path(assigns(:showdown))
  end

  it "destroys showdown" do
    assert_difference('Showdown.count', -1) do
      delete :destroy, id: @showdown
    end

    assert_redirected_to showdowns_path
  end
end
