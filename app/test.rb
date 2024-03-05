require_relative "./models/meal"
require_relative "./repositories/meal_repository"

pizza = Meal.new(name: "Pizza 2", price: 5)

repository = MealRepository.new(File.join(__dir__, '../data/meals'))

p repository.all

repository.create(pizza)

p repository.all
