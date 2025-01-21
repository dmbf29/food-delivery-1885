# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    puts "Welcome to our Restaurant!"
    puts "=========================="

    while @running
      @employee = @sessions_controller.login
      # who are you?
      # if you're a manager
      while @employee
        if @employee.manager?
          display_manager_menu
          action = gets.chomp.to_i
          print `clear`
          route_manager_action(action)
        else
          display_rider_menu
          action = gets.chomp.to_i
          print `clear`
          route_rider_action(action)
        end
      end
    end
  end

  private

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 9 then logout
    when 0 then stop
    else
      puts "Please press 1, 2 or 3."
    end
  end

  def route_rider_action(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 9 then logout
    when 0 then stop
    else
      puts "Please press 1, 2 or 3."
    end
  end

  def logout
    @employee = nil
  end

  def stop
    logout
    @running = false
  end

  def display_manager_menu
    puts ""
    puts "~~~~~~~~~~~~~MENU~~~~~~~~~~~~~"
    puts "What do you wnat to do?"
    puts ""
    puts "1 - List all Meals"
    puts "2 - Add new Meal"
    puts "3 - List customers"
    puts "4 - Add new customer"
    puts "5 - List all undelivered orders"
    puts "6 - Add new order"
    puts "9 - Logout"
    puts "0 - Stop and exit the program"
  end

  def display_rider_menu
    puts ""
    puts "~~~~~~~~~~~~~MENU~~~~~~~~~~~~~"
    puts "What do you wnat to do?"
    puts ""
    puts "1 - List my undelivered orders"
    puts "2 - Mark an order as delivered"
    puts "9 - Logout"
    puts "0 - Stop and exit the program"
  end
end
