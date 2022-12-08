#2.1
defmodule Geom do
    def area(width, length) do
        width*length
    end
end

#2.2
defmodule Geom2 do
    def area(width \\ 1, length \\ 1) do
        width*length
    end
end

#2.3
defmodule Geom3 do
    @moduledoc """
    A module for specific geometric calculations
    """

    @doc """
    A function which determines the rectangle area
    """
    def area(width \\ 1, length \\ 1) do
        width*length
    end
end

#2.4
defmodule Test do
    def sum( a \\ 3, b, c \\ 7) do
      a + b + c
    end
end
