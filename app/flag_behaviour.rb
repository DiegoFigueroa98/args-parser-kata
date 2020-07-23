# frozen_string_literal: true

# Parent class of any flag
class FlagBehaviour
  def identify_value
  end

  def create_flag_schema
    identify_value
    Schema.new(@name, @value)
  end
end
