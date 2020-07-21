# frozen_string_literal: true
require_relative 'schema'

# Schema class
class MainArgs
  def initialize(argv)
    @arguments = argv
    position = @arguments.index("-l")
  end
end

MainArgs.new(ARGV)
schema = Schema.new("l", "boolean", "false")
schema.to_s
