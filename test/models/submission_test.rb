require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  let(:submission) { FactoryGirl.create(:submission) }
  #Checks Factories and Fxitures
  it "has a valid factory" do
        skip
    #refactor to use save
  end

  #Checks Model Validations
  it "is invalid without a user" do 
    refute FactoryGirl.build(:submission, user_id: nil).valid?
  end

  it "is invalid without a composite_id" do 
    refute FactoryGirl.build(:submission, composite_id: nil).valid?
  end

  it "is invalid without a showdown_id" do 
    refute FactoryGirl.build(:submission, showdown_id: nil).valid?
  end

  it "is invalid without a properly formatted composite_id" do
    submission.composite_id = "ant0-0016-abmp/"

    refute submission.save!
  end
  
  # Checks Model Methods

  describe "class" do
    it "method extract_composite_id returns a submission's composite_id" do 
      url = "http://www.customink.com/designs/proofs/ant0-0016-abmp/front.jpg"
      Submission.extract_composite_id(url).must_equal "ant0-0016-abmp"
    end
  end 
end
