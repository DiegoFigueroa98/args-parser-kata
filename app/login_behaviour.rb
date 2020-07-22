# frozen_string_literal: true

require_relative 'flag_behaviour'
require_relative 'schema'

# Parent class of any flag
class LoginBehaviour < FlagBehaviour
  def initialize(flag_exists)
    @name = 'Login'
    @value = flag_exists
  end

  def create_flag_schema(_argv)
    Schema.new(@name, @value)
  end
end
