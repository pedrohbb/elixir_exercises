#5.1
defmodule AskArea do
    def area() do
        import Geom2, only: [area: 3]

        shape = get_shape()
        error = shape == :error
        if error do
            area()
        end
        dimensions = get_dimensions(shape)
        Geom2.area(shape, elem(dimensions,0), elem(dimensions,1))
    end

    def get_shape() do
        shape = IO.get("Shape: (R)ectangle, (T)riangle, (E)llipse") |> String.trim("\n")
        case shape do
            "R" -> :rectangle
            "r" -> :rectangle
            "T" -> :triangle
            "t" -> :triangle
            "E" -> :ellipse
            "e" -> :ellipse
            _ -> :error
        end
    end

    def get_dimensions(shape) do
        dim = case shape do
            :rectangle -> {IO.gets("Enter width > "), IO.gets("Enter height")}
            :triangle -> {IO.gets("Enter base > "), IO.gets("Enter height")}
            :ellipse -> {IO.gets("Enter minor radius > "), IO.gets("Enter major radius > ")}
        end

        dim = {
            elem(dim,0) |> String.trim(),
            elem(dim,1) |> String.trim()
        }

        cond
            elem(dim,0) < 0 -> :error
            elem(dim,1) < 0 -> :error
            elem(dim,0)*elem(dim,1) >= 0 -> dim
        end
    end

    def auxfunc1(a) do
        a = String.split(a, "", trim: true)
        List.pop_at(a,0, false)
    end

    def auxfunc2(lst) do
        List.pop_at(lst, 0, false)
        |> String.to
    end
end
