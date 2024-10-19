include("mod.jl")
include("inst.jl")

address = "C:/Users/budun/OneDrive/Área de Trabalho/----/Estudos/GEEOC/PIBITI/Códigos estudos/Projeto 2/instancias1a100/232.txt"

instance = UnPM.open_instance(address)

UnPM.test_file(instance, 30, 200)
un_parallel_machine(instance)