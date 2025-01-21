class SessionsView
  def ask_for(thing)
    puts "What's the #{thing}?"
    gets.chomp
  end

  def wrong_credentials
    puts "Sorry, wrong credentials"
  end

  def welcome(employee)
    puts "Welcome #{employee.username} 👋"
  end
end
