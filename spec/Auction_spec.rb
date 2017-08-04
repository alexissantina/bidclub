require 'spec_helper'

describe(Auction) do

  describe("#arts") do
    it("tells which art piece are in it") do
      test_auction = Auction.create({:name => "auction"})
      test_art1 = Art.create({:name => "art1", :auction_id => test_auction.id})
      test_art2 = Art.create({:name => "art2", :auction_id => test_auction.id})
     expect(test_auction.arts()).to(eq([test_art1, test_art2]))
    end
  end

end