require_relative '../views/orders_view'
require_relative '../views/employees_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end

  def list_undelivered_orders
    # ask the repository for the orders
    orders = @order_repository.undelivered_orders
    # give the orders to orders view to display
    @orders_view.display(orders)
  end

  def add
    # get the meals from the meal repo
    # give the meals to the meals view to display
    # tell the view to ask for the number (index)
    # get the meal instance with the index
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @meals_view.ask_for('number').to_i - 1
    meal = meals[index]

    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @customers_view.ask_for('number').to_i - 1
    customer = customers[index]

    employees = @employee_repository.all_riders
    @employees_view.display(employees)
    index = @employees_view.ask_for('number').to_i - 1
    employee = employees[index]

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_my_orders(employee)
    # ask the repository for MY orders
    orders = @order_repository.my_undelivered_orders(employee)
    # give the orders to the view
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.my_undelivered_orders(employee)
    @orders_view.display(orders)
    index = @orders_view.ask_for('number').to_i - 1
    # get the instance with the index
    order = orders[index]
    @order_repository.mark_as_delivered(order)
  end


end
