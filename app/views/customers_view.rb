class CustomersView
  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}) #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    gets.chomp
  end

  # def ask_for_price
  #   puts "What's the price?"
  #   gets.chomp
  # end
end
