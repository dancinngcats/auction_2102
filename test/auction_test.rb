require_relative 'test_helper'

class AuctionTest < Minitest::Test

  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')

    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')

    @auction = Auction.new
  end

  def test_it_exists
    assert_instance_of Auction, @auction
  end

  def test_it_has_attributes
    assert_equal [], @auction.items
  end

  def test_it_can_return_items
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    assert_equal [@item1, @item2], @auction.items
  end

  def test_it_can_return_item_names
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    assert_equal ["Chalkware Piggy Bank", "Bamboo Picture Frame"], @auction.item_names
  end

  def test_it_can_return_unpopular_items
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)

    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    assert_equal [@item2, @item3, @item5], @auction.unpopular_items

    @item3.add_bid(@attendee2, 15)

    assert_equal [@item2, @item5], @auction.unpopular_items
  end

  def test_it_can_return_potential_revenue
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    assert_equal 87, @auction.potential_revenue
  end

  def test_it_can_return_auction_bidders
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    assert_equal ["Megan", "Bob", "Mike"], @auction.bidders
  end

  def test_it_can_return_bidder_info
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    result =
    {
        @attendee1 =>
          {
            :budget => 50,
            :items => [@item1]
          },
        @attendee2 =>
          {
            :budget => 75,
            :items => [@item1, @item3]
          },
        @attendee3 =>
          {
            :budget => 100,
            :items => [@item4]
          }
       }
    assert_equal result, @auction.bidder_info
  end

end
