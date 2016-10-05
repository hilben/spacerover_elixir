defmodule SpaceroverTest do
  use ExUnit.Case
  doctest Spacerover

  test "the truth" do
    assert 1 + 1 == 2
  end

  
  test "spacerover is working" do
    input = 
      "4 4
      3 33 "
    output =
      ""
    assert Spacerover.InputProcessor.process(input) ==  output
  end
end
