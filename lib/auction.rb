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

  def bidders
    bidder_names = []
    @items.each do |item|
      item.bids.keys.each do |attendee|
        bidder_names << attendee.name
      end
    end
    bidder_names.uniq
  end

  def bidder_info
    bidderz_info = {}
    @items.each do |item|
      item.bids.each do |attendee, bid|
        bidderz_info[attendee] = {budget: 0, items: []} if bidderz_info[attendee].nil?
        bidderz_info[attendee][:budget] = attendee.budget
        bidderz_info[attendee][:items] << item
      end
    end
    bidderz_info
  end


end
