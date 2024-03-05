# TODO: implement the router of your app.
class Router
  def initialize(meal_controller, customer_controller)
    @meal_controller = meal_controller
    @customer_controller = customer_controller
    @running = true
  end

  def run
    while @running
      choice = display_options
      action(choice)
    end
  end

  private

  def display_options
    puts "---------------"
    puts "-----Menu------"
    puts "---------------"
    puts "1 -> list all meals"
    puts "2 -> add a meal"
    puts "3 -> list all customers"
    puts "4 -> add a customer"
    puts "5 -> edit a customer"
    puts "6 -> delete a customer"
    puts "9 -> quit the program"
    puts ">"
    gets.chomp.to_i
  end

  def action(choice)
    case choice
    when 1 then @meal_controller.list
    when 2 then @meal_controller.add
    when 3 then @customer_controller.list
    when 4 then @customer_controller.add
    when 5 then @customer_controller.edit
    when 6 then @customer_controller.destroy
    when 9 then @running = false
    else
      puts "Give some valid option"
    end
  end
end
