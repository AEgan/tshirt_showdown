require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  let(:user) { FactoryGirl.build(:nathan) }

  # Checks Model Validations
  it "it saves with valid data" do
    assert user.save
  end

  it "is invalid without a email" do 
    refute FactoryGirl.build(:user, email: nil).valid?
  end
  it "is invalid without a password" do 
    refute FactoryGirl.build(:user, password: nil).valid?
  end

end
