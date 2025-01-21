require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    # tell the view to ask for username
    username = @sessions_view.ask_for('username')
    # tell the view to ask for password
    password = @sessions_view.ask_for('password')
    # ask the repository for an employee with the given username
    employee = @employee_repository.find_by_username(username)
    # compare the password the user gave to password of the employee
    # Make sure we have an employee
    if employee && employee.password == password
      # if correct, welcome message
      @sessions_view.welcome(employee)
      return employee
    else
      # if NOT correct, wrong credentials
      @sessions_view.wrong_credentials
      login
    end
  end
end
