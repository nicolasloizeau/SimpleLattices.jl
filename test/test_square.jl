
using SimpleLattices
using Test
include("basic_tests.jl")

@testset "SquareLattice" begin
    Nx = 5
    Ny = 4
    lattice = SquareLattice(Nx, Ny)
    basic_tests(lattice, (Nx, Ny))
    @test length(edges(lattice)) == (Nx-1)*Ny + Nx*(Ny-1)
    e1 = Set(edges(lattice))
    e2 = Set([(1, 2), (2, 3), (3, 4), (4, 5), (6, 7), (7, 8), (8, 9), (9, 10), (11, 12), (12, 13), (13, 14), (14, 15), (16, 17), (17, 18), (18, 19), (19, 20), (1, 6), (6, 11), (11, 16), (2, 7), (7, 12), (12, 17), (3, 8), (8, 13), (13, 18), (4, 9), (9, 14), (14, 19), (5, 10), (10, 15), (15, 20)])
    @test e1 == e2
    lattice = SquareLattice(Nx, Ny, true, true)
    basic_tests(lattice, (Nx, Ny))
    @test length(edges(lattice)) == Nx*Ny*2
    e1 = Set(edges(lattice))
    e2 = Set([(1, 2), (2, 3), (3, 4), (4, 5), (6, 7), (7, 8), (8, 9), (9, 10), (11, 12), (12, 13), (13, 14), (14, 15), (16, 17), (17, 18), (18, 19), (19, 20), (1, 6), (6, 11), (11, 16), (2, 7), (7, 12), (12, 17), (3, 8), (8, 13), (13, 18), (4, 9), (9, 14), (14, 19), (5, 10), (10, 15), (15, 20), (5, 1), (10, 6), (15, 11), (20, 16), (16, 1), (17, 2), (18, 3), (19, 4), (20, 5)])
    @test e1 == e2
end
