require 'test_helper'

class ShowdownsControllerTest < ActionController::TestCase

  before do
    @showdown = FactoryGirl.create(:showdown)  
    sign_in @showdown.user
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
      post :create, showdown: { end_date: @showdown.end_date, 
                                theme: @showdown.theme,  
                                closed: @showdown.closed,
                                user: @showdown.user }
    end

    assert_redirected_to showdown_path(assigns(:showdown))
  end

  it "shows active showdown" do
    get :show, id: @showdown
    assert_template 'showdowns/show'
    assert_response :success
  end

  it "shows expired showdown" do
    expired_showdown = FactoryGirl.create(:showdown_expired)
    get :show, id: expired_showdown
    assert_response :success
    assert_template 'showdowns/showdown_expired'
  end

  it "shows expires soon showdown" do
    expires_soon_shodown = FactoryGirl.create(:showdown_expires_soon)
    get :show, id: expires_soon_shodown
    assert_response :success
    assert_template 'showdowns/show'
  end

  it "gets edit" do
    get :edit, id: @showdown
    assert_response :success
  end

  it "updates showdown" do
    patch :update, id: @showdown, showdown: { end_date: @showdown.end_date, 
                                              theme: @showdown.theme, 
                                              user: @showdown.user, 
                                              closed: @showdown.closed }
    assert_redirected_to showdown_path(assigns(:showdown))
  end

  it "destroys showdown" do
    assert_difference('Showdown.count', -1) do
      delete :destroy, id: @showdown
    end

    assert_redirected_to showdowns_path
  end

  after do
    sign_out @showdown.user
  end

end
