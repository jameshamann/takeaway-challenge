#Understands how to select dishes
require_relative 'menu'

class Order

  attr_reader :selected_dishes

  def initialize
    @selected_dishes = Hash.new(0)
  end

  def select_dishes(dish, quantity)
    @selected_dishes[dish] += quantity
  end
end
