defmodule Spacerover do
  defmodule InputProcessor do
    def process(input) do
      hd(String.split(input)) |> process_plateau
    end

    defp process_plateau(plateau) do
      String.split(plateau)
    end

    defp process_rover_input(rover_input) do
      "rover"
    end
  end
end
