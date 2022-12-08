#3.1
defmodule Geom do
    def area(:rectangle, width, length) do
        width*length
    end

    def area(:triangle, base, height) do
        base*height*0.5
    end

    def area(:ellipse, maj_radius, min_radius) do
        :math.pi()*maj_radius*min_radius
    end
end

#3.2
defmodule Geom2 do
    def area(:rectangle, width, length) when (width>0 and length>0) do
        width*length
    end

    def area(:triangle, base, height) when (height>0 and height>0) do
        base*height*0.5
    end

    def area(:ellipse, maj_radius, min_radius) when (maj_radius>0 and min_radius>0) do
        :math.pi()*maj_radius*min_radius
    end
end

#3.3
defmodule Geom3 do
    def area(:rectangle, width, length) when (width>0 and length>0) do
        width*length
    end

    def area(:triangle, base, height) when (height>0 and height>0) do
        base*height*0.5
    end

    def area(:ellipse, maj_radius, min_radius) when (maj_radius>0 and min_radius>0) do
        :math.pi()*maj_radius*min_radius
    end

    def area(_, _, _), do: 0
end

#3.4
defmodule Geom4 do
    @spec area(tuple) :: number
    def area(input) do
        area(elem(input,0), elem(input,1), elem(input,2))
    end

    defp area(:rectangle, width, length) when (width>0 and length>0) do
        width*length
    end

    defp area(:triangle, base, height) when (height>0 and height>0) do
        base*height*0.5
    end

    defp area(:ellipse, maj_radius, min_radius) when (maj_radius>0 and min_radius>0) do
        :math.pi()*maj_radius*min_radius
    end

    defp area(_, _, _), do: 0
end
