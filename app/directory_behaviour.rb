# frozen_string_literal: true

require_relative 'flag_behaviour'

# Parent class of any flag
class DirectoryBehaviour < FlagBehaviour
  def initialize(flag_exists, argv)
    super
    @name = 'Directory'
  end

  def identify_value
    position = @arguments.index('-d')
    if /^(\/[\w^ ]+)+\/?$/.match(@arguments[position + 1]) != nil && flag?(@arguments[position + 1]) == false
      @value = @arguments[position + 1]
    elsif @flags.include?(@arguments[position + 1]) || @arguments[position + 1] == nil
      @value = ''
    else
      @value = 'Error, given value is not a valid path'
    end
  end
end
