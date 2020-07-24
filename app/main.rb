# frozen_string_literal: true
require_relative 'logging_behaviour'
require_relative 'port_behaviour'
require_relative 'directory_behaviour'

# Schema class
class MainArgs
  def initialize(argv)
    @arguments = argv
    @flags = []
  end

  def obtain_flag_schema
    @flags.push(LoggingBehaviour.new(@arguments.include?('-l'), @arguments))
    @flags.push(PortBehaviour.new(@arguments.include?('-p'), @arguments))
    @flags.push(DirectoryBehaviour.new(@arguments.include?('-d'), @arguments))
  end

  def show_flags_result
    obtain_flag_schema
    @flags.each do |flag|
      puts flag.create_flag_schema.to_s
    end
  end
end

MainArgs.new(ARGV).show_flags_result