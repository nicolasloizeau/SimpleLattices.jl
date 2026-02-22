



struct TriangularLattice <: AbstractLattice2D
    Nx::Int
    Ny::Int
    xperiodic::Bool
    yperiodic::Bool
end



TriangularLattice(Nx::Int, Ny::Int; xperiodic::Bool=false, yperiodic::Bool=false) = TriangularLattice(Nx, Ny, xperiodic, yperiodic)
Base.length(lattice::TriangularLattice) = lattice.Nx * lattice.Ny
Base.size(lattice::TriangularLattice) = (lattice.Nx, lattice.Ny)

function positions_int(lattice::TriangularLattice)
    Nx, Ny = lattice.Nx, lattice.Ny
    return vec([(x, y) for x in 0:Nx-1, y in 0:Ny-1])
end


function positions(lattice::TriangularLattice)
    Nx, Ny = lattice.Nx, lattice.Ny
    return vec([(x + 0.5*y, sqrt(3)/2*y) for x in 0:Nx-1, y in 0:Ny-1])
end

function sites(lattice::TriangularLattice)
    return 1:lattice.Nx * lattice.Ny
end


function periodic_boundary_edges(lattice::TriangularLattice)
    pos = positions_int(lattice)
    pos_dict = Dict(p => i for (i, p) in enumerate(pos))
    edges = []
    if lattice.xperiodic
        for y in 0:lattice.Ny-1
            push!(edges, (pos_dict[(lattice.Nx-1, y)], pos_dict[(0, y)]))
        end
        for y in 1:lattice.Ny-1
            push!(edges, (pos_dict[(lattice.Nx-1, y)], pos_dict[(0, mod(y-1, lattice.Ny))]))
        end
    end
    if lattice.yperiodic
        for x in 0:lattice.Nx-1
            push!(edges, (pos_dict[(x, lattice.Ny-1)], pos_dict[(x, 0)]))
        end
        for x in 1:lattice.Nx-1
            push!(edges, (pos_dict[(x, lattice.Ny-1)], pos_dict[(mod(x-1, lattice.Nx), 0)]))
        end
    end
    if lattice.xperiodic && lattice.yperiodic
        push!(edges, (pos_dict[(lattice.Nx-1, 0)], pos_dict[(0, lattice.Ny-1)]))
    end
    return edges
end

function edges(lattice::TriangularLattice)
    pos = positions_int(lattice)
    pos_dict = Dict(p => i for (i, p) in enumerate(pos))
    edges = []
    for y in 0:lattice.Ny-1
        for x in 0:lattice.Nx-2
            push!(edges, (pos_dict[(x, y)], pos_dict[(x+1, y)]))
        end
    end
    for x in 0:lattice.Nx-1
        for y in 0:lattice.Ny-2
            push!(edges, (pos_dict[(x, y)], pos_dict[(x, y+1)]))
        end
    end

    for x in 0:lattice.Nx-2
        for y in 1:lattice.Ny-1
            push!(edges, (pos_dict[(x, y)], pos_dict[(x+1, y-1)]))
        end
    end
    append!(edges, periodic_boundary_edges(lattice))
    return edges
end
