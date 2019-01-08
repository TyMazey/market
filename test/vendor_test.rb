require_relative 'test_helper'

class VendorTest < Minitest::Test

  def test_it_exsist
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_name
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_it_starts_with_no_invetory
    vendor = Vendor.new("Rocky Mountain Fresh")
    exact = {}

    assert_equal exact, vendor.invetory
  end

  def test_items_start_out_of_stock
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_it_can_stock_items
    vendor = Vendor.new("Rocky Mountain Fresh")

    vendor.stock("Peaches", 30)

    assert_equal 30, vendor.check_stock("Peaches")
  end

  def test_stocking_items_changes_invetory
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)

    exact = {"Peaches" => 30}

    assert_equal exact, vendor.invetory
  end
end
