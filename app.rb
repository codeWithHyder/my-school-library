require_relative './modules/list_books'
require_relative './modules/list_people'
require_relative './modules/add_book'
require_relative './modules/add_person'
require_relative './modules/add_rental'
require_relative './modules/list_rentals'

require_relative './modules/display_menu_options'

class App
  include ListAllBooks
  include ListAllPeople
  include CreatePerson
  include AddBook
  include AddRental
  include ListAllRentals
  include DisplayMenu
  attr_accessor :persons, :books, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def run
    loop do
      display_menu_options
      option = gets.chomp.to_i
      puts "\n"
      break if option == 7

      process_option(option)
    end
  end

  def process_option(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      add_person
    when 4
      add_book
    when 5
      add_rental
    when 6
      list_rentals
    else
      puts "Invalid option! Please choose a valid option.\n\n"
    end
  end
end
