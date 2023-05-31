require_relative 'decorator'

class CapitalizeDecorator < Decorator
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    super.capitalize
  end
end
