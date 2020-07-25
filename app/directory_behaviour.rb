# frozen_string_literal: true

require_relative 'flag_behaviour'

# Parent class of any flag
class DirectoryBehaviour < FlagBehaviour
  def initialize(argv)
    super
    @name = 'Directory'
    @error_msg = 'Error, given value is not a valid String List'
    argv.include?('-d') ? identify_supposed_value('-d') : @value = ''
  end

  def identify_value
    return @value = '' if flag?(@supposed_value) || @supposed_value.nil?
    return @value = @supposed_value if valid_flag_value?

    !valid_flag_value? && !list_type? ? not_valid_list : valid_list
  end

  def valid_flag_value?
    regex = %r{^(\/[\w^ ]+)+\/?$}
    !regex.match(@supposed_value).nil? && !flag?(@supposed_value)
  end

  def valid_list
    @name = 'String List'
    @value = @supposed_value.split(',')
  end

  def not_valid_list
    @name = 'String List'
    @value = @error_msg
  end
end
