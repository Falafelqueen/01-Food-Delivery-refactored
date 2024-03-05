require 'csv'
require_relative '../models/meal'

# require base directory
require_relative './base_repository'

class MealRepository < BaseRepository
  # everything will be inherited from the base one

  private

  def csv_headers
    # this will overwrite the base class
    ['id', 'name', 'price']
  end

  def element_to_row(meal)
    [meal.id, meal.name, meal.price]
  end

  def row_to_element(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
