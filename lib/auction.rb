class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    unpop_items = []
    @items.each do |item|
      unpop_items << item if item.bids.values == []
    end
    unpop_items
  end

  def potential_revenue
    all_high_bids = []
    @items.each do |item|
      all_high_bids << item.current_high_bid
    end
    all_high_bids.compact.sum
  end
end
