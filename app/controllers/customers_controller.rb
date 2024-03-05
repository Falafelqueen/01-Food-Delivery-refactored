require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @customers_view = CustomersView.new
  end

  def list
    # get all the instancances of the meals from repo
    customers = @customer_repo.all
    # call some view method to display them
    @customers_view.display(customers)
  end

  def add
    # ask user for the meal name
    name = @customers_view.ask_for_stuff('name')
    # ask user for the meal price
    address = @customers_view.ask_for_stuff('address')
    # create new meal (meal repo)
    new_customer = Customer.new(name: name, address: address)
    @customer_repo.create(new_customer)
  end

  def edit
    list
    id = @customers_view.ask_for_id
    customer_to_edit = @customer_repo.find(id)
    choice = @customers_view.ask_for_stuff('What do you want to edit')
    update_attribute(choice, customer_to_edit)
  end

  def destroy
    list
    id = @customers_view.ask_for_id
    customer_to_delete = @customer_repo.find(id)
    @customer_repo.delete(customer_to_delete)
  end

  private

  def update_attribute(choice, customer_to_edit)
    if choice == 'name'
      name = @customers_view.ask_for_stuff('name')
      customer_to_edit.name = name
      @customer_repo.update
    elsif choice == 'address'
      address = @customers_view.ask_for_stuff('address')
      customer_to_edit.address = address
      @customer_repo.update
    end
  end
end
