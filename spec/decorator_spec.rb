require_relative '../decorator'

describe 'test Decorator class' do
  decorator = Decorator.new('Hyder')

  it 'takes parameter and return a Decorator class ' do
    expect(decorator).to be_instance_of(Decorator)
  end

  it 'should have attributes' do
    expect(decorator).to have_attributes(nameable: 'Hyder')
  end

  it 'raises NotImplementedError for other subclasses' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
