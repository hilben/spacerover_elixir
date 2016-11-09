defmodule SpaceroverTest do
  use ExUnit.Case
  doctest Spacerover

  test "spacerover is working" do
    input = 
    "5 5
    1 2 N
    LMLMLMLMM
    3 3 E
    MMRMMRMRRM"

    output = [{1, 1, "N"}, {5, 5, "E"}]
    assert Spacerover.InputProcessor.process(input) ==  output
  end
end
