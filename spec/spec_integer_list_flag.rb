# frozen_string_literal: true

require_relative '../app/integer_list_behaviour'

RSpec.describe 'Integer List Flag with arguments' do
  let(:int_list) { IntegerListBehaviour.new(["-g", "1,2,3,4,5"]) }
  it "Checks the result of a integer list flag" do
    expect(int_list.create_flag_schema.to_s).to eq('Integer List : ["1", "2", "3", "4", "5"]')
  end
end

RSpec.describe 'Integer List Flag with no arguments' do
  let(:int_list) { IntegerListBehaviour.new(["-g"]) }
  it "Checks the result of a integer list flag with no arguments" do
    expect(int_list.create_flag_schema.to_s).to eq('Integer List : []')
  end
end