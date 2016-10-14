defmodule SpaceroverTest do
  use ExUnit.Case
  doctest Spacerover

  test "spacerover is working" do
    output = [{1, 1, "N"}, {5, 5, "E"}]
    input = Spacerover.InputProcessor.input()  
    assert Spacerover.InputProcessor.process(input) ==  output
  end
end
