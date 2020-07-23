# frozen_string_literal: true
require_relative 'flag_behaviour'

# Parent class of any flag
class PortBehaviour < FlagBehaviour
  def initialize(flag_exists, argv)
    @name = 'Port'
    @value = flag_exists
    @arguments = argv
  end
  
  def identify_value
    position = @arguments.index('-p')
    if /\A[-+]?\d+\z/.match(@arguments[position + 1]) != nil
      @value = @arguments[position + 1]
    elsif @arguments[position + 1] == "-d" || @arguments[position + 1] == "-l" || @arguments[position + 1] == nil
      @value = 0
    else
      @value = "Error, given value is not a integer"
    end
      
  end
end
