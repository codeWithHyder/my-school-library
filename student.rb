require_relative 'person'

class Student < Person
  attr_accessor :type
  attr_reader :classroom

  def initialize(age, name, classroom, parent_permission)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @type = 'Student'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
