class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @meal = attributes[:meal] # INSTANCE of a meal
    @customer = attributes[:customer] # INSTANCE of a customer
    @employee = attributes[:employee] # INSTANCE of an employee
    @delivered = attributes[:delivered] || false # boolean
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end

# p Order.new
