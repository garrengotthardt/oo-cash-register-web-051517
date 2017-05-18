require 'pry'

class CashRegister
  attr_accessor :total, :discount, :cart, :previous_total, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = {}
  end

  def add_item(title, price, quantity=1)
    @last_transaction = {}
    @previous_total = @total
    @total = (@previous_total + (price*quantity))
    @cart[title] = [price, quantity]
    @last_transaction[title] = [price, quantity]


  end

  def apply_discount
    if discount > 0
      @total = (@total - (@total*(@discount.to_f/100.0)))
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    items_list = []
    @cart.each do |item, price_and_quantity|
      #binding.pry
        (price_and_quantity[1]).times do
          items_list << item
        end
    end
    items_list
  end


  def void_last_transaction
    @total = (@total - @last_transaction.values[0][0])
  end




end
