# require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"
require_relative "router"
# p Meal.new(name: "quiche", price: 500)

meal_csv = "data/meals.csv"

meal_repository = MealRepository.new(meal_csv)
meals_controller = MealsController.new(meal_repository)

customer_csv = "data/customers.csv"
customer_repository = CustomerRepository.new(customer_csv)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)
# p meal_repository
# meals_controller.add
# meals_controller.list

# p meal_repository.all

router.run
