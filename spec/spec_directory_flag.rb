# frozen_string_literal: true

require_relative '../app/directory_behaviour'

RSpec.describe 'Directory Flag Behaviour' do
  it "Checks the result of a directory flag schema" do
    directory = DirectoryBehaviour.new(["-d", "/etc/diego"])
    expect(directory.create_flag_schema.to_s).to eq("Directory : /etc/diego")
  end

  it "Checks the result of a directory flag schema when there is an error" do
    directory = DirectoryBehaviour.new(["-d", "etc/diego.txt;"])
    expect(directory.create_flag_schema.to_s).to eq("Directory : Error, given value is not a valid path")
  end

  it "Checks the result of a directory flag schema when has no values associated" do
    directory = DirectoryBehaviour.new(["-d", "-l"])
    expect(directory.create_flag_schema.to_s).to eq("Directory : ")
    directory = DirectoryBehaviour.new(["-d", "-p"])
    expect(directory.create_flag_schema.to_s).to eq("Directory : ")
    directory = DirectoryBehaviour.new(["-d"])
    expect(directory.create_flag_schema.to_s).to eq("Directory : ")
  end
end