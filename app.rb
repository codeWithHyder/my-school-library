require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rentable'

class App
  attr_accessor :persons, :books, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def line_return
    puts '---------------------------'
  end

  def print_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def print_books_by_index
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_books
    @books.length.positive? ? print_books : (puts 'No books available')
    line_return
  end

  def print_persons_by_index
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def print_persons
    @persons.each do |person|
      puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_people
    @persons.length.positive? ? print_persons : (puts 'No person available')
    line_return
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Classroom: '
    classroom = gets.chomp.capitalize
    print 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.downcase
    while parent_permission != 'y' && parent_permission != 'n'
      print 'Please input Y or N: '
      parent_permission = gets.chomp.downcase
    end
    student = Student.new(age, name, classroom) if parent_permission == 'y'
    student = Student.new(age, name, classroom, parent_permission: false) if parent_permission == 'n'
    @persons << student
    puts 'Student successfully created'
    line_return
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    person = Teacher.new(age, specialization, name)
    @persons << person
    puts 'Teacher successfully created'
    line_return
  end

  def add_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    person_type = gets.chomp
    while person_type != '1' && person_type != '2'
      print 'Please input 1 or 2: '
      person_type = gets.chomp
    end
    if person_type == '1'
      add_student
    else
      add_teacher
    end
  end

  def add_book
    puts 'What is the title of the book?'
    title = gets.chomp
    puts 'Who is the author of the book?'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book successfully created'
    line_return
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

  def add_rental
    if @books.empty?
      puts 'There are no books available'
      line_return

      return
    end
    if @persons.empty?
      puts 'There are no persons available'
      line_return
      return
    end
    book = select_book_to_rent
    person = select_person_to_rent
    print 'Date: (DD\MM\YYYY): '
    date = gets.chomp
    rental = Rental.new(date, person, book)
    @rentals << rental
    puts 'Rental created successfully'
    line_return
  end

  def list_rentals
    puts 'Id of the person: '
    person_id = gets.chomp.to_i
    person = @persons.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person do not exist'
      line_return
      return
    end
    puts "Rentals of #{person.name}:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
    end
    line_return
  end
end