require 'csv'
require_relative '../models/customer'
require_relative './base_repository'

class CustomerRepository < BaseRepository

  private

  def csv_headers
    # this will overwrite the base class
    ['id', 'name', 'address']
  end

  def element_to_row(customer)
    [customer.id, customer.name, customer.address]
  end

  def row_to_element(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end
end
