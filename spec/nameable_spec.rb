require_relative '../nameable'

describe 'test nameable class' do
  nameable = Nameable.new

  it 'takes parameter and return a Nameable object ' do
    expect(nameable).to be_kind_of(Nameable)
  end

  it 'takes parameter and return a Nameable decorator ' do
    expect(nameable).to be_instance_of(Nameable)
  end
end
