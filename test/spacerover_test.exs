defmodule SpaceroverTest do
  use ExUnit.Case
  doctest Spacerover

  test "the truth" do
    assert 1 + 1 == 2
  end

  
  test "spacerover is working" do
    input = 
      "5 5
      1 2 N
      LMLMLMLMM
      3 3 E
      MMRMMRMRRM"
    output =
      "1 3 N
       5 1 E"
    input_processed = input |> String.split("\n")
    IO.puts "processed input"
    IO.puts input
    assert Spacerover.InputProcessor.process(input_processed) ==  output
  end
end
