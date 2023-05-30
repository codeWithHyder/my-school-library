require_relative 'person'

class Teacher < Person
  attr_accessor :type
  attr_reader :specialization

  def initialize(age, name, specialization, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @type = 'Teacher'
  end

  def can_use_services?
    true
  end
end
