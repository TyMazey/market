class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors.push(vendor)
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.invetory.include?(item) && vendor.invetory[item] > 0
    end
  end

  def sorted_item_list
    items = @vendors.map do |vendor|
      vendor.invetory.keys
    end
    items.flatten.uniq.sort
  end

  def total_invetory
    total = Hash.new(0)
    @vendors.each do |vendor|
      vendor.invetory.keys.each do |item|
        total[item] += vendor.invetory[item]
      end
    end
    total
  end

  def sell(item, amount)
    if total_invetory.include?(item) && total_invetory[item] >= amount
      process_sale(item, amount)
    else false
    end
  end

  def process_sale(item, amount)
    amount.times do
      vendors_that_sell(item)[0].invetory[item] -= 1
    end
  end
end
