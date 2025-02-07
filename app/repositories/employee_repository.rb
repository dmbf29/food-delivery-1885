require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv if File.exist?(@csv_file_path)
  end

  def find_by_username(username) # return an INSTANCE of an employee
    @employees.find do |employee|
      employee.username == username
    end
  end

  def all_riders
    @employees.select do |employee|
      employee.rider?
    end
  end

  def find(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # load each row from the CSV and create an instance to put in the array
      attributes[:id] = attributes[:id].to_i
      @employees << Employee.new(attributes)
    end
  end
end


# Order load_csv
# attributes[:meal_id] # from CSV that needs to be an instance
# attributes[:meal] = @meal_repository.find(attributes[:meal_id].to_i)
