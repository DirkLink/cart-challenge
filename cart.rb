require 'pry'
class Cart
  attr_reader :tax_rate
  def initialize *rate
    if rate.empty?
      @tax_rate = 1.1
    else
      @tax_rate = rate.first[:tax_rate]
    end
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
    total = 0
    @contents.each do |item|
      total+=item.price
    end
    total
  end

  def cost_after_tax
    cost_before_tax * @tax_rate
  end



end

class Item
 attr_reader :name, :price

 def initialize name, price
  @name = name
  @price = price
 end 
end