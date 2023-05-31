require_relative '../student'
require_relative '../classroom'

describe Student do
  classroom = Classroom.new('Class A')
  student = Student.new(16, 'James Engel', classroom, true)

  describe '#initialize' do
    it 'sets the age, name, classroom, parent_permission, and type' do
      expect(student.age).to eq(16)
      expect(student.name).to eq('James Engel')
      expect(student.classroom).to eq(classroom)
      expect(student.parent_permission).to eq(true)
      expect(student.type).to eq('Student')
    end
  end

  describe '#classroom=' do
    it 'assigns the classroom and adds the student to the classroom' do
      new_classroom = Classroom.new('Class B')
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns a string indicating playing hooky' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
