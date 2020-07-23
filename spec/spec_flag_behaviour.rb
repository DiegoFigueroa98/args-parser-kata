# frozen_string_literal: true

require_relative '../app/logging_behaviour'
require_relative '../app/port_behaviour'
require_relative '../app/directory_behaviour'

RSpec.describe 'Logging Flag Behaviour' do
  it "Checks the result of a logging flag schema" do
    logging = LoggingBehaviour.new(true, nil)
    expect(logging.create_flag_schema.to_s).to eq("Logging : true")
  end

  it "Checks the result of a port flag schema" do
    port = PortBehaviour.new(true, ["-p", "8808"])
    expect(port.create_flag_schema.to_s).to eq("Port : 8808")
  end

  it "Checks the result of a port flag schema when there is an error" do
    port = PortBehaviour.new(true, ["-p", "8808p"])
    expect(port.create_flag_schema.to_s).to eq("Port : Error, given value is not a integer")
  end

  it "Checks the result of a port flag schema when has no values associated" do
    port = PortBehaviour.new(true, ["-p", "-l"])
    expect(port.create_flag_schema.to_s).to eq("Port : 0")
    port = PortBehaviour.new(true, ["-p", "-d"])
    expect(port.create_flag_schema.to_s).to eq("Port : 0")
    port = PortBehaviour.new(true, ["-p"])
    expect(port.create_flag_schema.to_s).to eq("Port : 0")
  end

  it "Checks the result of a directory flag schema" do
    directory = DirectoryBehaviour.new(true, ["-d", "/etc/diego"])
    expect(directory.create_flag_schema.to_s).to eq("Directory : /etc/diego")
  end

  it "Checks the result of a directory flag schema when there is an error" do
    directory = DirectoryBehaviour.new(true, ["-d", "etc/diego.txt;"])
    expect(directory.create_flag_schema.to_s).to eq("Directory : Error, given value is not a valid path")
  end
end