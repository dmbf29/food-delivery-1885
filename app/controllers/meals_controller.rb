require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # get all of the meals from the repository
    meals = @meal_repository.all
    # give the meals to the view to display
    @meals_view.display(meals)
  end

  def add
    # ask the view to ask the user for a name and store it in a variable
    name = @meals_view.ask_for("name")
    # ask the view to ask the user for a price and store it in a variable
    price = @meals_view.ask_for("price")
    # create an instance of a meal
    meal = Meal.new(name: name, price: price)
    # store it in the repository
    @meal_repository.create(meal)
  end
end
