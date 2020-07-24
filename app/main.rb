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

  def obtain_present_flags
    @flags.push(obtain_flag_schema('-l')) if flag_appears?('-l')
    @flags.push(obtain_flag_schema('-p')) if flag_appears?('-p')
    @flags.push(obtain_flag_schema('-d')) if flag_appears?('-d')
  end

  def show_flags_result
    obtain_present_flags
    @flags.each do |flag|
      puts flag.create_flag_schema.to_s
    end
  end

  def flag_appears?(flag_name)
    @arguments.include?(flag_name)
  end

  def obtain_flag_schema(flag_name)
    appears = flag_appears?(flag_name)
    return LoggingBehaviour.new(appears, @arguments) if flag_name == '-l'
    return PortBehaviour.new(appears, @arguments) if flag_name == '-p'
    return DirectoryBehaviour.new(appears, @arguments) if flag_name == '-d'
  end
end

MainArgs.new(ARGV).show_flags_result
