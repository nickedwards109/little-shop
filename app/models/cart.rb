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
    contents.sum do |item_id, quantity|
      item = Item.find(item_id)
      item.price * quantity
    end
  end

  def change_quantity(item_id, quantity)
    contents[item_id.to_s] += quantity.to_i
    remove_item(item_id) if contents[item_id.to_s] <= 0
  end
end
