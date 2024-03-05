require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @meals_view = MealsView.new
  end

  def list
    # get all the instancances of the meals from repo
    meals = @meal_repo.all
    # call some view method to display them
    @meals_view.display(meals)
  end

  def add
    # ask user for the meal name
    name = @meals_view.ask_for_stuff('name')
    # ask user for the meal price
    price = @meals_view.ask_for_stuff('price').to_i
    # create new meal (meal repo)
    new_meal = Meal.new(name: name, price: price)
    @meal_repo.create(new_meal)
  end
end
