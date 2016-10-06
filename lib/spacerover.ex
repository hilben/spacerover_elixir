require IEx;

defmodule Spacerover do
  defmodule InputProcessor do
    def process([plateau | t]) do
      plateau |> process_rover_input(t, [])
    end

    def process_rover_input(plateau, [position | t], state) do
      position = position |> String.trim |> String.split |> List.to_tuple
      {x,y,a} = position
      IO.puts(x)
      IO.puts(y)
      position = {String.to_integer(x), String.to_integer(y), a}
      [movement | remainder] = t
      movement = movement |> String.trim |> String.split("")

      IO.puts("movement")
      IO.puts(movement)
      movement |> Enum.map( fn (move) -> IO.puts("|#{move}|") end)

      updated = movement |> Enum.reduce(position ,fn (move, position) -> updatemove(position,{move}) end)



      IO.puts("updated")
      updated |> Tuple.to_list |> Enum.map( fn (move) -> IO.puts("|#{move}|") end)

      plateau
    end

    def process_rover_input(plateau, [], state), do: state

    def update_rover(plataeu, { x, y, direction}, [c | tail]) do

    end


    def updatemove({x,y,"N"},{"L"}), do: {x,y,"W"}
    def updatemove({x,y,"N"},{"R"}), do: {x,y,"E"}

    def updatemove({x,y,"E"},{"L"}), do: {x,y,"N"}
    def updatemove({x,y,"E"},{"R"}), do: {x,y,"S"}
   
    def updatemove({x,y,"S"},{"L"}), do: {x,y,"E"}
    def updatemove({x,y,"S"},{"R"}), do: {x,y,"W"}
    
    def updatemove({x,y,"W"},{"L"}), do: {x,y,"S"}
    def updatemove({x,y,"W"},{"R"}), do: {x,y,"N"}

    def updatemove({x,y,"N"},{"M"}), do: {x,y-1, "N"}
    def updatemove({x,y,"E"},{"M"}), do: {x+1,y, "E"}
    def updatemove({x,y,"S"},{"M"}), do: {x,y+1, "S"}
    def updatemove({x,y,"W"},{"M"}), do: {x-1,y, "W"}
    def updatemove(arg,_), do: arg 
  end
end
