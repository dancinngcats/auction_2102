require_relative 'test_helper'

class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  def test_it_exists
    assert_instance_of Item, @item1
  end

  def test_it_has_attributes
    assert_equal "Chalkware Piggy Bank", @item1.name
  end
end
