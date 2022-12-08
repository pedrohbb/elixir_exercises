#4.1
defmodule Geom2 do
    def area(shape, a, b) when (a>0 and b>0) do
        case shape do
            :rectangle -> a*b
            :triangle -> a*b/2
            :ellipse -> :math.pi()*a*b
        end
    end
end

#4.2
defmodule Dijkstra do
    def gcd(m,n) do
        cond do
            m==n -> m
            m>n -> gcd(m-n,n)
            m<n -> gcd(m, n-m)
        end
    end
end

#4.2 --- alternative solution
defmodule Dijkstra do
    def gcd(m,n) when m==n do
        m
    end

    def gcd(m,n) when m>n do
        gcd(m-n, n)
    end

    def gcd(m,n) when m<n do
        gcd(m, n-m)
    end
end

#4.3
defmodule Powers do
    import Kernel, except: [raise: 2]

    def raise(_x,0) do
        1
    end

    def raise(x, n) when n>0 do
        raise(x,n-1)*x
    end

    def raise(x,n) do
        raise(x, n+1)/x
    end
end

#4.4
defmodule Powers2 do
    import Kernel, except: [raise: 2, raise: 3]

    def raise(_x,0) do
        1
    end

    def raise(x, n) when n>0 do
        raise(x,n, 1)
    end

    def raise(x,n) do
        1/raise(x,-n,1)
    end

    defp raise(x, n, aux) do
        cond do
            n==0 -> aux
            n>0 -> aux = aux*x; raise(x,n-1,aux)
        end
    end
end

#4.5
defmodule Powers3 do
    import Kernel, except: [raise: 2, raise: 3]

    def raise(_x,0) do
        1
    end

    def raise(x, n) when n>0 do
        raise(x,n, 1)
    end

    def raise(x,n) do
        1/raise(x,-n,1)
    end

    defp raise(x, n, aux) do
        cond do
            n==0 -> aux
            n>0 -> aux = aux*x; raise(x,n-1,aux)
        end
    end

    def nth_root(x, n) do
        nth_root(x,n,x/2)
    end

    defp nth_root(x, n, a) do
        aux = a - (raise(a,n) - x)/(n*raise(a,n-1))
        IO.puts("Current guess is #{aux}")
        # case root_error(x,n,aux,1.0e-8) do
        #     true -> aux
        #     false -> nth_root(x,n,aux)
        # end
        if root_error(x, n, aux, 1.0e-8) do
            aux
        else
            nth_root(x,n,aux)
        end
    end

    defp root_error(x, n, y, eps) do
        raise(y,n) - x <= eps
    end
end
