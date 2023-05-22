require_relative 'person'
class Student < Person
  def initialize(age, class_room, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission)
    @class_room = class_room
  end

  def play_hocky
    '¯(ツ)/¯'
  end
end
