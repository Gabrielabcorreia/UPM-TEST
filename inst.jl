module UnPM

struct Instanceupm
    p::Array{Int, 2}
    m::Int            
    n::Int           
end

function open_instance(address::String)
    lines = readlines(address)

    n, m, _ = parse.(Int, split(lines[1]))

    p = zeros(Int, m, n)

    for j in 1:n
        line_idx = j + 2
        line = split(lines[line_idx])
        for i in 1:m
            column_idx = i * 2
            p[i, j] = parse(Int, line[column_idx])
        end
    end
    return Instanceupm(p, m, n)
end

function test_file(instance, m::Int, n::Int)

    @assert size(instance.p) == (m, n) "Error: invalide array size"
    @assert instance.m == m "Error: number of machines not matched"
    @assert instance.n == n "Error: number of tasks not matched"

end
end