# frozen_string_literal: true
require_relative 'flag_behaviour'

# Parent class of any flag
class PortBehaviour < FlagBehaviour
  def initialize(flag_exists)
    @name = 'Port'
    @value = flag_exists
  end

  def create_flag_schema(argv)
    Schema.new(@name, @value)
  end

  def indetify_value(argv)
    position = argv.index('-p')
    if /\A[-+]?\d+\z/.match(argv[position + 1])
      @value = argv[position + 1]
    else
      @value = "Error, given value is not a integer"
    end
  end
end