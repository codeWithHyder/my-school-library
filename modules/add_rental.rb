require_relative('../rental')
require 'date'

module AddRental
  def print_books_by_index
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def print_persons_by_index
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def select_book_to_rent
    puts 'Select a book from the following list by number'
    print_books_by_index
    book_index = gets.chomp.to_i
    while book_index.negative? || book_index >= @books.length
      puts 'Please input a valid index'
      book_index = gets.chomp.to_i
    end
    puts 'book selected'
    @books[book_index]
  end

  def select_person_to_rent
    puts 'Select a person from the following list by number (not id)'
    print_persons_by_index
    person_index = gets.chomp.to_i
    while person_index.negative? || person_index >= @persons.length
      puts 'Please input a valid index'
      person_index = gets.chomp.to_i
    end
    puts 'person selected'
    @persons[person_index]
  end

  def input_date
    puts 'input the date of the rental'
    print 'Month of the year (mm): '
    month = gets.chomp.to_i
    print 'Day of the month (dd): '
    day = gets.chomp.to_i
    print 'Year (yyyy): '
    year = gets.chomp.to_i
    unless Date.valid_date?(year, month, day)
      puts 'Please input a valid date'
      return input_date
    end
    "#{month}/#{day}/#{year}"
  end

  def add_rental
    if @books.empty?
      puts 'There are no books available'

      return
    end
    if @persons.empty?
      puts 'There are no persons available'
      return
    end
    book = select_book_to_rent
    person = select_person_to_rent
    date = input_date
    rental = Rental.new(date, person, book)
    @rentals << rental
    puts 'Rental created successfully'
  end
end
