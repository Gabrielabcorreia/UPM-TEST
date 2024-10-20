using JuMP, HiGHS

function un_parallel_machine(instance)
    model = Model(HiGHS.Optimizer)

    @variable(model, x[1:instance.m, 1:instance.n], Bin)
    @variable(model, Cmax ≥ 0)

    @objective(model, Min, Cmax)

    for j in 1:instance.n
        @constraint(model, sum(x[i, j] for i in 1:instance.m) == 1)
    end

    for i in 1:instance.m 
        @constraint(model, sum(instance.p[i,j]*x[i, j] for j in 1:instance.n) ≤ Cmax)
    end

    optimize!(model)

    return Cmax, x, model
end

function save_solution(Cmax, x, model)

    if JuMP.termination_status(model) == MOI.OPTIMAL
        open("un_parallel_machine.txt", "w") do file 
            write(file, "Minimum makespan: $(value(Cmax))\n")

            for i in 1:instance.m
                for j in 1:instance.n
                    if value(x[i, j]) > 0.5
                        write(file, "$j, $i\n")
                    end
                end
            end
        end
    else
        println("The optimal solution cannot be found")
        open("un_parallel_machine.txt", "w") do file 
            write(file, "Minimum makespan: $(value(Cmax))\n")
        end
    end
end
