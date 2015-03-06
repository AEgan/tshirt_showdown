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

  it "has default value for closed" do
    assert FactoryGirl.build(:showdown, closed: nil).valid?
  end


end
