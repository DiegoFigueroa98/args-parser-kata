# frozen_string_literal: true
require_relative 'schema'

# Schema class
class MainArgs
  def initialize(argv)
    @arguments = argv
    position = @arguments.index("-l")
  end
end
