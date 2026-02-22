

function basic_tests(lattice::AbstractLattice, Ls::NTuple{N,Int}) where N
    @test size(lattice) == Ls
    @test length(sites(lattice)) == length(lattice)
    @test length(positions(lattice)) == length(lattice)
    @test length(Set(edges(lattice))) == length(edges(lattice))
    @test length(Set(positions(lattice))) == length(positions(lattice))
    @test typeof(lattice) <: AbstractLattice
    if N == 2
        @test typeof(lattice) <: AbstractLattice2D
    elseif N == 3
        @test typeof(lattice) <: AbstractLattice3D
    end
end
