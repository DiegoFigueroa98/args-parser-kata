# frozen_string_literal: true

require_relative '../app/logging_behaviour'

RSpec.describe 'Logging Flag Behaviour' do
  it "Checks the result of a logging flag schema" do
    logging = LoggingBehaviour.new(true, nil)
    expect(logging.create_flag_schema.to_s).to eq("Logging : true")
  end
end
