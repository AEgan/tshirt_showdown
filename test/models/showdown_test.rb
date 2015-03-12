require 'test_helper'

class ShowdownTest < ActiveSupport::TestCase
  let(:showdown) { FactoryGirl.create(:showdown) }
  let(:expired_showdown) { FactoryGirl.create(:showdown_expired)}
  let(:nathan) { FactoryGirl.create(:nathan)}

  #Checks Model Validations
  it "it saves with valid data" do
   # assert showdown.s ave
  end

  it "is invalid without a theme" do 
    refute get_invalid_factory(:theme).valid?
  end
  it "is invalid without an end_date" do 
    refute get_invalid_factory(:end_date).valid?
  end

  it "is invalid without a user" do 
    refute get_invalid_factory(:user).valid?
  end

  it "has default value for closed" do
    assert get_invalid_factory(:closed).valid?
  end

  #Check Model Scopes
  it 'get_current_user_votes scope returns votes when user has voted' do

    submission = Submission.create(composite_id: "ant0-0016-abmp",showdown_id: showdown.id, user_id: nathan.id)
    Vote.create(user_id: nathan.id, submission_id: submission.id)

    has_voted = Showdown.get_current_user_votes(showdown.id, nathan.id)
    has_voted.wont_be_empty
  end

  it 'get_current_user_votes scope returns no votes when user has not voted' do
    has_voted = Showdown.get_current_user_votes(showdown.id, nathan.id)
    has_voted.must_be_empty
  end

  it 'returns true when the showdown is over' do 
    expired_showdown.over?.must_equal true 
  end

  it 'returns false when the showdown is not over' do 
    showdown.over?.must_equal false
  end

  it 'returns the correct winner for a showdown' do
    should_not_be_winner = FactoryGirl.create(:submission, showdown: showdown)
    should_be_winner = FactoryGirl.create(:submission_with_votes, showdown: showdown)

    showdown.get_winner.composite_id.must_equal should_be_winner.composite_id
  end

  private
  def get_invalid_factory(attrib) 
    FactoryGirl.build(:showdown, attrib => nil)
  end


end
