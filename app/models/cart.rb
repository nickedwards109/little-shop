class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def dollar_subtotal(item)
    id = item.id.to_s
    quantity = contents[id]
    quantity * item.price
  end

  def total_dollar_amount
    total = 0
    contents.each do |item_id, quantity|
      item = Item.find(item_id)
      total += item.price * quantity
    end
    total
  end
end
