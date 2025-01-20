# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to our Restaurant!"
    puts "=========================="

    while @running
      display_menu
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then stop
    else
      puts "Please press 1, 2 or 3."
    end
  end

  def stop
    @running = false
  end

  def display_menu
    puts ""
    puts "~~~~~~~~~~~~~MENU~~~~~~~~~~~~~"
    puts "What do you wnat to do?"
    puts ""
    puts "1 - List all Meals"
    puts "2 - Add new Meal"
    puts "3 - List customers"
    puts "4 - Add new customer"
    puts "5 - Stop and exit the program"
  end
end
