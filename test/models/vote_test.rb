require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  let(:vote) { FactoryGirl.build(:vote) }

  # Checks Factories and Fxitures
  it "has a valid factory" do
    assert vote.save
  end

  # Checks Model Validations
  it "is invalid without a user_id" do 
    refute FactoryGirl.build(:vote, user_id: nil).valid?
  end
  it "is invalid without a submission_id" do 
    refute FactoryGirl.build(:vote, submission_id: nil).valid?
  end

end
