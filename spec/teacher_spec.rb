require_relative '../teacher'

describe 'test Teacher class' do
  context 'instance of Teacher' do
    teacher = Teacher.new(45, 'Amine', 'Math')

    it 'takes three parameters and returns a Teacher object' do
      expect(teacher).to be_instance_of(Teacher)
    end
    it 'should have attributes' do
      expect(teacher).to have_attributes(age: 45)
      expect(teacher).to have_attributes(name: 'Amine')
      expect(teacher).to have_attributes(parent_permission: true)
      expect(teacher).to have_attributes(specialization: 'Math')
      expect(teacher).to have_attributes(type: 'Teacher')
    end
    it 'the methods should work' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
