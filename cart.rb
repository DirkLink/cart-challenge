require 'pry'
class Cart
  attr_reader :tax_rate
  def initialize rate={}
      @tax_rate = rate[:tax_rate] || 10
    @contents = []
  end

  def add_item item
    @contents.push(item)
  end

  def item_count
    @contents.count
  end

  def contains? item
    @contents.include?(item)
  end

  def cost_before_tax
    @contents.map {|item| item.price}
    .reduce(:+)
  end

  def cost_after_tax
    cost_before_tax * (@tax_rate+100.0)/100.0
  end



end

class Item
 attr_reader :name, :price

 def initialize name, price
  @name = name
  @price = price
 end 
end