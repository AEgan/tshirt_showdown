require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  let(:user) { FactoryGirl.create(:nathan) }

  # Checks Factories and Fxitures
  it "has a valid factory" do
    assert user.valid?
  end

  # Checks Model Validations
  it "is invalid without a email" do 
    refute FactoryGirl.build(:user, email: nil).valid?
  end
  it "is invalid without a password" do 
    refute FactoryGirl.build(:user, password: nil).valid?
  end

end
