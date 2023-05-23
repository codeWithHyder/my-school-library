require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    super.length > 10 ? super[0..9] : super
  end
end
