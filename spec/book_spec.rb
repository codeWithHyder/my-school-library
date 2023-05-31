require_relative '../book'
require_relative '../person'
require_relative '../rentable'

describe 'test book class' do
  context 'have an instance of Book' do
    book = Book.new('Ballet Shoes', 'Noel Streatfield')
    it 'takes two parameters and returns a Book object' do
      expect(book).to be_instance_of(Book)
    end
  end
  context 'use rental method' do
    book = Book.new('Ballet Shoes', 'Noel Streatfield')
    person = Person.new(19, 'david')
    rental = Rental.new('4/13/2022', person, book)
    book.add_rental(person, '4/13/2022')

    it 'Rentals array should contain the rental' do
      expect(book.rentals.include?(rental)).to eql true
    end
  end
end
