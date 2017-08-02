require('spec_helper')

describe(Art) do
  before() do
    Art.clear()
  end

  describe(".not_purchased") do
    it("returns the not purchased art") do
      not_done_art1 = Art.create({:name => "gotta do it", :purchased => false})
      not_done_art2 = Art.create({:name => "gotta do it too", :purchased => false})
      not_done_arts = [not_done_art1, not_done_art2]
      done_art = Art.create({:name => "bought", :pruchased => true})
      expect(Art.not_done()).to(eq(not_done_arts))
    end
  end
end