class CustomersView
  def display(customers)
    puts "-------------"
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_for_stuff(stuff)
    puts "#{stuff}?"
    gets.chomp
  end

  def ask_for_id
    puts "Which customer you want to edit (number)"
    gets.chomp.to_i
  end
end
