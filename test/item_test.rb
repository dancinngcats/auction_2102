require_relative 'test_helper'

class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')

    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
  end

  def test_it_exists
    assert_instance_of Item, @item1
  end

  def test_it_has_attributes
    assert_equal "Chalkware Piggy Bank", @item1.name
  end

  def test_it_can_return_bids
    assert_equal ({}), @item1.bids

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    assert_equal ({@attendee2 => 20, @attendee1 => 22}), @item1.bids
  end

  def test_it_can_return_high_bid
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    assert_equal 22, @item1.current_high_bid
  end
end
