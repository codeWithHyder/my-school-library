require_relative '../person'
require_relative '../book'
require_relative '../rentable'

describe 'test person class' do
  context 'instance of Person' do
    person = Person.new(45, 'amine')

    it 'takes two parameters and returns a Person object' do
      expect(person).to be_instance_of(Person)
    end

    it 'should have attributes' do
      expect(person).to have_attributes(age: 45)
      expect(person).to have_attributes(name: 'amine')
      expect(person).to have_attributes(parent_permission: true)
    end

    it 'the methods should work' do
      expect(person.can_use_services?).to be true
      expect(person.correct_name).to eq('amine')
    end
  end

  context 'use rental method' do
    person = Person.new(19, 'david')
    rental = Rental.new('4/13/2022', person, Book.new('Title', 'author'))
    person.add_rental(Book.new('Title', 'author'), '4/13/2022')

    it 'Rentals array should contain the rental' do
      expect(person.rentals.include?(rental)).to eql true
    end
  end
end
