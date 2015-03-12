module ShowdownsHelper

    @@url = "http://www.customink.com/designs/proofs/"
    @@front_proof = "/front.jpg"
    @@back_proof = "/back.jpg"

  def get_front_proof(composite_id)
    @@url + composite_id + @@front_proof
  end
  
  def get_back_proof(composite_id)
    @@url + composite_id + @@back_proof
  end


end