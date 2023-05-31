require_relative '../capitalizedecorator'
require_relative '../person'

describe 'CapitalizeDecorator  class' do
  person = Person.new(25, 'David')
  capitalize_decorator = CapitalizeDecorator.new(person)

  it 'takes parameter and return a CapitalizeDecorator class ' do
    expect(capitalize_decorator).to be_instance_of(CapitalizeDecorator)
  end
  it 'should have attributes' do
    expect(capitalize_decorator).to have_attributes(nameable: person)
  end

  it 'the methods should work' do
    puts
    expect(capitalize_decorator.correct_name).to eql('David')
  end
end
