require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  let(:vote) { FactoryGirl.build(:vote) }

  # Checks Model Validations
  it "it saves with valid data" do
    assert vote.save
  end
  
  it "is invalid without a user_id" do 
    refute FactoryGirl.build(:vote, user_id: nil).valid?
  end
  it "is invalid without a submission_id" do 
    refute FactoryGirl.build(:vote, submission_id: nil).valid?
  end

end
