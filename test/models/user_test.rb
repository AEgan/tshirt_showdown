require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  let(:user) { FactoryGirl.create(:nathan) }

  # Checks Factories and Fxitures
  it "has a valid factory" do
    user.valid?
  end

  # Checks Model Validations
  it "is invalid without a email" do 
    refute FactoryGirl.build(:user, email: nil).valid?
  end
  it "is invalid without a password" do 
    refute FactoryGirl.build(:user, password: nil).valid?
  end

  # Checks Model Methods
  it "returns a user's email" do 
    user.email.must_equal "nhessler@customink.com"
  end

  it "returns a user's password" do 
    user.password.must_equal "theprofessler"
  end

  it "has valid showdowns" do 
    user.showdowns.each do |showdown|
      showdown.valid?
    end 
  end

  it "has valid submissions" do 
    user.submissions.each do |submission|
      submission.valid?
    end 
  end
end
