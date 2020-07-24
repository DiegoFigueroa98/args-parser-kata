# frozen_string_literal: true

require_relative 'flag_behaviour'

# Parent class of any flag
class DirectoryBehaviour < FlagBehaviour
  def initialize(flag_exists, argv)
    super
    @name = 'Directory'
    @error_msg = 'Error, given value is not a valid path'
    identify_supposed_value('-d')
  end

  def identify_value
    @supposed_value.nil? ? @value = '' : flag_value_is_not_nill
  end

  def flag_value_is_not_nill
    valid_flag_value? ? @value = @supposed_value : @value = @error_msg
    @value = '' if flag?(@supposed_value)
  end

  def valid_flag_value?
    regex = /^(\/[\w^ ]+)+\/?$/
    regex.match(@supposed_value) != nil && flag?(@supposed_value) == false
  end
end
