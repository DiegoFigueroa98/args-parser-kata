# frozen_string_literal: true
require_relative 'flag_behaviour'

# Parent class of any flag
class DirectoryBehaviour < FlagBehaviour
  def initialize(flag_exists, argv)
    @name = 'Directory'
    @value = flag_exists
    @arguments = argv
  end
  
  def identify_value
    position = @arguments.index('-d')
    if /^(\/[\w^ ]+)+\/?$/.match(@arguments[position + 1]) != nil
      @value = @arguments[position + 1]
    else
      @value = "Error, given value is not a valid path"
    end
  end
end
