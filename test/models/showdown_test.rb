require 'test_helper'

class ShowdownTest < ActiveSupport::TestCase
  let(:showdown) { FactoryGirl.create(:showdown) }

  # Checks Factories and Fxitures
  it "has a valid factory" do
    showdown.valid?
  end

  #Checks Model Validations
  it "is invalid without a theme" do 
    refute FactoryGirl.build(:showdown, theme: nil).valid?
  end
  it "is invalid without an end_date" do 
    refute FactoryGirl.build(:showdown, end_date: nil).valid?
  end

  it "is invalid without a user" do 
    refute FactoryGirl.build(:showdown, user_id: nil).valid?
  end

  it "is invalid without a valid user" do 
    refute FactoryGirl.build(:showdown_invalid_user).valid?
  end

  it "has default value for closed" do
    assert FactoryGirl.build(:showdown, closed: nil).valid?
  end

  # Checks Model Methods
  it "returns a showdown's theme" do 
    showdown.theme.must_equal 'Atari themed shirts'
  end

  it "returns a showdown's end_date" do 
    showdown.end_date.must_equal Date.new(2015, 03, 02)
  end

  it "returns a showdown's closed property" do
    showdown.closed.must_equal false
  end

  it "returns a valid user" do 
    showdown.user.must_be_instance_of User
  end

  it "returns valid submissions" do 
    showdown.submissions.each do |submission|
      assert submission.valid?
    end
  end

end
