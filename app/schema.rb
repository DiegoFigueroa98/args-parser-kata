# frozen_string_literal: true

# Schema class
Schema = Struct.new(:name, :value) do
  def to_s
    "Argument: #{name} Value: #{value}"
  end
end
