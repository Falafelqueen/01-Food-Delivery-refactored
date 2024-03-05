require "csv"

class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(element)
    element.id = @next_id
    @elements << element

    @next_id += 1
    save_to_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end


  def delete(element)
    @elements.delete(element)
    save_to_csv
  end

  def update
    save_to_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      @elements << row_to_element(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_to_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << csv_headers
      @elements.each do |element|
        csv << element_to_row(element)
      end
    end
  end

  # will be overwritten by the child method
  def csv_hearders; end
  # will be overwritten by the child method
  def element_to_row(element); end
  # will be overwritten by the child method
  def row_to_element(row); end
end
