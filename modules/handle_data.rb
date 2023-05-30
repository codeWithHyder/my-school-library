require 'json'
require 'fileutils'
require_relative '../teacher'
require_relative '../student'
require_relative '../book'

module HandleData
  def check_data_files
    FileUtils.mkdir_p('./data')
    File.open('./data/persons.json', 'w') unless File.exist?('./data/persons.json')
    File.open('./data/books.json', 'w') unless File.exist?('./data/books.json')
    File.open('./data/rentals.json', 'w') unless File.exist?('./data/rentals.json')
  end

  def load_books
    books = []
    json_data = File.read('./data/books.json')
    unless json_data.empty?
      JSON.parse(json_data).map do |book|
        data = Book.new(book['title'], book['author'])
        data.rentals = book['rentals']
        books << data
      end
    end
    books
  end

  def load_student(person)
    student = if person['parent_permission']
                Student.new(person['age'], person['name'], person['classroom'], true)
              else
                Student.new(person['age'], person['name'], person['classroom'], false)
              end
    student.type = person['type']
    student.id = person['id']
    student.rentals = person['rentals']
    student
  end

  def load_teacher(person)
    teacher = Teacher.new(person['age'], person['name'], person['specialization'])
    teacher.type = person['type']
    teacher.id = person['id']
    teacher.rentals = person['rentals']
    teacher
  end

  def load_persons
    persons = []
    json_data = File.read('./data/persons.json')
    unless json_data.empty?
      JSON.parse(json_data).map do |person|
        persons << if person['type'] == 'Teacher'
                     load_teacher(person)
                   else
                     load_student(person)
                   end
      end
    end
    persons
  end

  def load_rental_data(rental)
    puts rental['date']
    data = {
      date: rental['date'],
      id: rental['id'],
      name: rental['name'],
      age: rental['age'],
      parent_permission: rental['parent_permission'],
      type: rental['type'],
      title: rental['title'],
      author: rental['author']
    }
    if rental['type'] == 'Teacher'
      data['specialization'] = rental['specialization']
    else
      data['classroom'] = rental['classroom']
    end

    data
  end

  def load_rentals
    rentals = []
    json_data = File.read('./data/rentals.json')
    unless json_data.empty?
      JSON.parse(json_data).map do |rental|
        data = load_rental_data(rental)
        rentals << data
      end
    end

    rentals
  end
end

module SaveData
  def save_books
    books_data = @books.map { |book| { 'title' => book.title, 'author' => book.author, 'rentals' => book.rentals } }
    File.write('./data/books.json', JSON.pretty_generate(books_data))
  end

  def load_rental_data(rental)
    rental_data = {
      date: rental[:date],
      id: rental[:id],
      name: rental[:name],
      age: rental[:age],
      parent_permission: rental[:parent_permission],
      type: rental[:type],
      title: rental[:title],
      author: rental[:author]
    }

    if rental[:type] == 'Teacher'
      rental_data[:specialization] = rental[:specialization]
    else
      rental_data[:classroom] = rental[:classroom]
    end
    rental_data
  end

  def save_rentals
    data = []
    @rentals.each do |rental|
      rental_data = load_rental_data(rental)
      data << rental_data
    end
    puts 'save'
    File.write('./data/rentals.json', JSON.pretty_generate(data))
  end

  def save_persons
    data = []
    @persons.each do |person|
      person_data = {
        id: person.id,
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission,
        rentals: person.rentals,
        type: person.type
      }
      if person.type == 'Teacher'
        person_data[:specialization] = person.specialization
      else
        person_data[:classroom] = person.classroom
      end
      data << person_data
    end
    return if data.empty?

    File.write('./data/persons.json', JSON.pretty_generate(data))
  end
end
