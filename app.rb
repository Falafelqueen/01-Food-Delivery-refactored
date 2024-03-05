# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/meal_repository'

require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/customer_repository'

require_relative 'router'

meal_file = File.join(__dir__, './data/meals.csv')
customer_file = File.join(__dir__, './data/customers.csv')

meal_repo = MealRepository.new(meal_file)
meal_controller = MealsController.new(meal_repo)

customer_repo = CustomerRepository.new(customer_file)
customer_controller = CustomersController.new(customer_repo)


router = Router.new(meal_controller, customer_controller)

router.run
