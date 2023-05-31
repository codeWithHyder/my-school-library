require_relative '../decorator'

describe 'test Decorator class' do
  decorator = Decorator.new('amine')

  it 'takes parameter and return a Decorator class ' do
    expect(decorator).to be_instance_of(Decorator)
  end

  it 'should have attributes' do
    expect(decorator).to have_attributes(nameable: 'amine')
  end

  it 'raises NotImplementedError for other subclasses' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
