# frozen_string_literal: true

require_relative 'flag_behaviour'
require_relative 'schema'

# Parent class of any flag
class LoggingBehaviour < FlagBehaviour
  def initialize(flag_exists, _argv)
    @name = 'Logging'
    @value = flag_exists
  end
end
