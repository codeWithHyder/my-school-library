require_relative('../teacher')
require_relative('../student')

module CreatePerson
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
  end
end
