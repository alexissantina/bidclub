require('spec_helper')

describe(Art) do
  it("validates presence of name") do
    art = Art.new({:name => ""})
    expect(art.save()).to(eq(false))
  end

  describe(".not_purchased") do
    it("returns the not purchased art") do
      not_done_art1 = Art.create({:name => "gotta do it", :purchased => false})
      not_done_art2 = Art.create({:name => "gotta do it too", :purchased => false})
      not_done_arts = [not_done_art1, not_done_art2]
      done_art = Art.create({:name => "bought", :purchased => true})
      expect(Art.not_purchased()).to(eq(not_done_arts))
    end
  end

  describe("#auction") do
    it("tells which auction it belongs to") do
      test_auction = Auction.create({:name => "auction"})
      test_art = Art.create({:name => "art", :auction_id => test_auction.id})
      expect(test_art.auction()).to(eq(test_auction))
    end
  end

  it("ensures the length of name is at most 50 characters") do
    art = Art.new({:name => "a".*(51)})
    expect(art.save()).to(eq(false))
  end
end