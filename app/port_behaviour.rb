# frozen_string_literal: true

require_relative 'flag_behaviour'

# Parent class of any flag
class PortBehaviour < FlagBehaviour
  def initialize(flag_exists, argv)
    super
    @name = 'Port'
    @error_msg = 'Error, given value is not a integer'
    identify_supposed_value('-p')
  end

  def identify_value
    @supposed_value.nil? ? @value = 0 : flag_value_is_not_nill
  end

  def flag_value_is_not_nill
    valid_flag_value? ? @value = @supposed_value : @value = @error_msg
    @value = 0 if flag?(@supposed_value)
  end

  def valid_flag_value?
    regex = /\A[-+]?\d+\z/
    regex.match(@supposed_value) != nil && flag?(@supposed_value) == false
  end
end
