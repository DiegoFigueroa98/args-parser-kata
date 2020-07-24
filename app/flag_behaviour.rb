# frozen_string_literal: true

require_relative 'schema'

# Parent class of any flag
class FlagBehaviour
  def initialize(flag_exists, argv)
    @value = flag_exists
    @arguments = argv
    @flags = ['-l', '-p', '-d']
  end

  def identify_value; end

  def create_flag_schema
    identify_value
    Schema.new(@name, @value)
  end

  def flag?(argument)
    @flags.include?(argument)
  end
end
