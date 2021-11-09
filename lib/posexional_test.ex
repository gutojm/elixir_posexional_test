defmodule PosexionalTest do
  @moduledoc """
  Documentation for `PosexionalTest`.
  """

  alias PosexionalTest.TestFile

  def run do
    TestFile.write_file!([
      header: [code: "1", info: "header", more_info: "xx"],
      detail: [detail_number: "1", info: "detail"],
      detail: [detail_number: "2", info: "detail"],
      detail: [detail_number: "3", info: "detail"],
      footer: []
    ],'./test.txt')

    File.read!('./test.txt')
    |> IO.inspect()
    |> TestFile.read()
    |> IO.inspect()

    :ok
  end
end
