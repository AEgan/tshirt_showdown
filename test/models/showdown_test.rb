require 'test_helper'

class ShowdownTest < ActiveSupport::TestCase
  let(:showdown) { FactoryGirl.create(:showdown) }

  # Checks Factories and Fxitures
  it "has a valid factory" do
    showdown.valid?
  end

  #Checks Model Validations
  it "is invalid without a email" do 
    refute FactoryGirl.build(:showdown, theme: nil).valid?
  end
  it "is invalid without a password" do 
    refute FactoryGirl.build(:showdown, end_date: nil).valid?
  end

  it "is invalid without closed" do
    refute FactoryGirl.build(:showdown, closed: nil).valid?
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

end
