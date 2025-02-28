class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    # total_area = 0
    # @rooms.each do |room|
    #   total_area += room.area
    # end
    # total_area

    total_area = @rooms.map do |room|
      room.area
    end
    total_area.reduce(:+)
  end

  def details
    details_hash = {}
    details_hash["price"] = @price
    details_hash["address"] = @address
    details_hash
  end

  def price_per_square_foot
    ppsf = @price.to_f / area
    ppsf.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end.reverse
  end

  def rooms_by_category
    @rooms.group_by do |room|
      room.category
    end
  end

end
