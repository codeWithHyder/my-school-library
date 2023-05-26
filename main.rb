require_relative 'app'

def display_menu_options
  puts 'Please choose an option by entering a number:'
  puts '1- List all books'
  puts '2- List all people'
  puts '3- Create a person'
  puts '4- Create a book'
  puts '5- Create a rental'
  puts '6- List all rentals for a given person id'
  puts '7- Exit'
end

def run_app(app)
  menu_options = {
    '1' => :list_books,
    '2' => :list_people,
    '3' => :add_person,
    '4' => :add_book,
    '5' => :add_rental,
    '6' => :list_rentals,
    '7' => :exit
  }

  loop do
    display_menu_options
    input = gets.chomp

    if menu_options.key?(input)
      action = menu_options[input]
      app.send(action)
      break if action == :exit
    else
      puts 'Invalid input. Please try again.'
    end
  end
end

def main
  app = App.new
  puts 'Welcome to the School Library App!'
  run_app(app)
end

main
