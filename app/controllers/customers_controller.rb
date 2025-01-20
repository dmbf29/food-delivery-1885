require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # get all of the customers from the repository
    customers = @customer_repository.all
    # give the customers to the view to display
    @customers_view.display(customers)
  end

  def add
    # ask the view to ask the user for a name and store it in a variable
    name = @customers_view.ask_for("name")
    # ask the view to ask the user for a address and store it in a variable
    address = @customers_view.ask_for("address")
    # create an instance of a customer
    customer = Customer.new(name: name, address: address)
    # store it in the repository
    @customer_repository.create(customer)
  end
end
