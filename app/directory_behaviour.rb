# frozen_string_literal: true

require_relative 'flag_behaviour'

# Parent class of any flag
class DirectoryBehaviour < FlagBehaviour
  def initialize(argv)
    super
    @name = 'Directory'
    @error_msg = 'Error, given value is not a valid path'
    argv.include?('-d') ? identify_supposed_value('-d') : @value = ''
  end

  def identify_value
    return @value = '' if flag?(@supposed_value) || @supposed_value.nil?

    @value = valid_flag_value? ? @supposed_value : @error_msg
  end

  def valid_flag_value?
    regex = %r{^(\/[\w^ ]+)+\/?$}
    !regex.match(@supposed_value).nil? && flag?(@supposed_value) == false
  end
end
