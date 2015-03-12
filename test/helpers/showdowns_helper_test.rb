require 'showdowns_helper'

class ShowdownsHelperTest < ActionView::TestCase

  before do 
    @composite_id = "vrq0-0015-1b0t"
    @front_url = "http://www.customink.com/designs/proofs/#{@composite_id}/front.jpg"
    @back_url = "http://www.customink.com/designs/proofs/#{@composite_id}/back.jpg"
  end

  it "returns the url for the front of the proof" do
    get_front_proof(@composite_id).must_equal @front_url
  end

  it "returns the url for the back of the proof" do
    get_back_proof(@composite_id).must_equal @back_url
  end

end
