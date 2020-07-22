# frozen_string_literal: true
require_relative 'flag_behaviour'

# Parent class of any flag
class DirectoryBehaviour < FlagBehaviour
  def initialize(flag_exists)
    @name = 'Directory'
    @value = flag_exists
  end

  def create_flag_schema(argv)
  end

  def indetify_value(argv)
  end
end