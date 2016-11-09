require IEx;

defmodule Spacerover do
    def main(args) do
      args |> parse_args |> process
    end

    defp process([]), do: IO.puts "No arguments given"
    defp process(options) do
      IO.puts "Parsing #{options[:file]}"
      {_, input} =  File.read options[:file]

      IO.puts "Data #{input}"
      Spacerover.InputProcessor.process(String.split(input, "\n")) |> IO.inspect
    end

    defp parse_args(args) do
      {options, _, _} = OptionParser.parse(args, switches: [name: :string])
      options
    end

  defmodule InputProcessor do
    def process(input) when is_bitstring(input), do: process(String.split(input,"\n"))
    def process([plateau | t]) do
      plateau |> process_rover_input(t, [])
    end

    def process_rover_input(_, [""|_], state), do: state
    def process_rover_input(plateau, [position | t], state) do
      position = position |> process_position

      [movement | remainder] = t

      updated = movement 
                |> String.trim 
                |> String.split("") 
                |> Enum.reduce(position, fn (move, position) -> updatemove(position,{move}) end)

      process_rover_input(plateau, remainder, state ++ [updated])
    end

    def process_position(position) do
      {x,y,direction} = position 
      |> String.trim 
      |> String.split 
      |> List.to_tuple
       {String.to_integer(x), String.to_integer(y), direction}
    end

    def process_rover_input(_, _, state), do: state

    def updatemove({x,y,"N"},{"L"}), do: {x,y,"W"}
    def updatemove({x,y,"N"},{"R"}), do: {x,y,"E"}
    def updatemove({x,y,"E"},{"L"}), do: {x,y,"N"}
    def updatemove({x,y,"E"},{"R"}), do: {x,y,"S"}
    def updatemove({x,y,"S"},{"L"}), do: {x,y,"E"}
    def updatemove({x,y,"S"},{"R"}), do: {x,y,"W"}
    def updatemove({x,y,"W"},{"L"}), do: {x,y,"S"}
    def updatemove({x,y,"W"},{"R"}), do: {x,y,"N"}

    def updatemove({x,y,"N"},{"M"}), do: {x,y - 1, "N"}
    def updatemove({x,y,"E"},{"M"}), do: {x + 1,y, "E"}
    def updatemove({x,y,"S"},{"M"}), do: {x, y + 1, "S"}
    def updatemove({x,y,"W"},{"M"}), do: {x - 1, y, "W"}
    def updatemove(arg,{_}), do: arg 
  end
end

