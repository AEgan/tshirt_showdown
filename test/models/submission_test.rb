require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  let(:submission) { FactoryGirl.build(:submission) }

  before do
    @url = "http://www.customink.com/designs/proofs/ant0-0016-abmp/front.jpg"
  end

  #Checks Model Validations
  it "it saves with valid data" do
    assert submission.save
  end

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
    submission.composite_id = "12345"
    refute submission.save
  end
  
  # Checks Model Methods

  describe "class" do
    it "method extract_composite_id returns a submission's composite_id" do 
      Submission.extract_composite_id(@url).must_equal "ant0-0016-abmp"
    end
  end 
end
