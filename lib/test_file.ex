defmodule PosexionalTest.TestFile do
  use PosexionalFile

  @separator "\n"

  row :header, &__MODULE__.is_header?/1 do
    fixed_value "00"
    value :code, 5, filler: ?0, alignment: :right
    progressive_number :inc, 5
    value :info, 10, filler: ?-
    value :more_info, 10
    empty 2
    fixed_value "!"
  end

  row :detail, &__MODULE__.is_detail?/1 do
    value :detail_number, 2, filler: ?0, alignment: :right
    progressive_number :inc, 5
    value :info, 10, filler: ?-
    empty 5
    fixed_value "!"
  end

  row :footer, &__MODULE__.is_footer?/1 do
    fixed_value "99"
    progressive_number :inc, 5
    empty 7
    fixed_value "!"
  end

  def is_header?(<<"00", _::binary>>), do: true
  def is_header?(_), do: false

  def is_footer?(<<"99", _::binary>>), do: true
  def is_footer?(_), do: false

  def is_detail?(<<"00", _::binary>>), do: false
  def is_detail?(<<"99", _::binary>>), do: false
  def is_detail?(_), do: true
end
