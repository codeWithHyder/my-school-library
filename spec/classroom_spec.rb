require_relative '../classroom'
require_relative '../student'

describe Classroom do
  classroom = Classroom.new('Class A')
  student = Student.new(16, 'John Doe', classroom, true)

  describe '#initialize' do
    it 'sets the label and initializes an empty array of students' do
      expect(classroom.label).to eq('Class A')
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds the student to the classroom and assigns the classroom to the student' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
