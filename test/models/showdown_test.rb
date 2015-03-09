require 'test_helper'

class ShowdownTest < ActiveSupport::TestCase
  let(:showdown) { FactoryGirl.build(:showdown) }

  #Checks Model Validations
  it "it saves with valid data" do
    assert showdown.save
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

  def get_invalid_factory(attrib) 
    FactoryGirl.build(:showdown, attrib => nil)
  end

end
