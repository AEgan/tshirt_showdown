require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  let(:submission) { FactoryGirl.create(:submission) }
  #Checks Factories and Fxitures
  it "has a valid factory" do
    submission.must_be :valid?
  end

  #Checks Model Validations
  it "is invalid without a user" do 
    refute FactoryGirl.build(:submission, user_id: nil).valid?
  end

  it "is invalid without a composite_id" do 
    refute FactoryGirl.build(:submission, composite_id: nil).valid?
  end

  # Checks Model Methods
  it "returns a submission's user" do 
    submission.user.must_be_kind_of User 
  end

  it "returns a submission's composite_id" do 
    submission.composite_id.must_equal 'wvrq0-0015-1b0t'
  end

end
