class Vendor
  attr_reader :name,
              :invetory

  def initialize(name)
    @name = name
    @invetory = Hash.new(0)
  end

  def check_stock(item)
    @invetory[item]
  end

  def stock(item, amount)
    @invetory[item] = amount
  end
end
