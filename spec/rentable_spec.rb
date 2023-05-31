require_relative '../person'
require_relative '../book'
require_relative '../rentable'

describe 'test rental class' do
  context 'instance of Rental' do
    book = Book.new('A Song of Ice and Fire', 'George R. R. Martin')
    person = Person.new(25, 'david')
    rental = Rental.new('6/25/2012', person, book)

    it 'takes three parameters and returns a Rental object' do
      expect(rental).to be_instance_of(Rental)
    end

    it 'should have attributes' do
      expect(rental.person).to be_instance_of(Person)
      expect(rental.book).to be_instance_of(Book)
    end
  end
end
