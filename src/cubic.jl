
struct CubicLattice <: AbstractLattice3D
    Nx::Int
    Ny::Int
    Nz::Int
    xperiodic::Bool
    yperiodic::Bool
    zperiodic::Bool
end

Base.length(lattice::CubicLattice) = lattice.Nx * lattice.Ny * lattice.Nz
Base.size(lattice::CubicLattice) = (lattice.Nx, lattice.Ny, lattice.Nz)

function positions(lattice::CubicLattice)
    Nx, Ny, Nz = lattice.Nx, lattice.Ny, lattice.Nz
    pos = [(x, y, z) for x in 0:Nx-1, y in 0:Ny-1, z in 0:Nz-1]
    return vec(pos)
end

function sites(lattice::CubicLattice)
    return 1:lattice.Nx * lattice.Ny * lattice.Nz
end

function edges(lattice::CubicLattice)
    pos = positions(lattice)
    pos_dict = Dict(p => i for (i, p) in enumerate(pos))
    edges = []
    for z in 0:lattice.Nz-1
        for y in 0:lattice.Ny-1
            for x in 0:lattice.Nx-2
                push!(edges, (pos_dict[(x, y, z)], pos_dict[(x+1, y, z)]))
            end
        end
    end
    for z in 0:lattice.Nz-1
        for x in 0:lattice.Nx-1
            for y in 0:lattice.Ny-2
                push!(edges, (pos_dict[(x, y, z)], pos_dict[(x, y+1, z)]))
            end
        end
    end
    for y in 0:lattice.Ny-1
        for x in 0:lattice.Nx-1
            for z in 0:lattice.Nz-2
                push!(edges, (pos_dict[(x, y, z)], pos_dict[(x, y, z+1)]))
            end
        end
    end
    if lattice.xperiodic
        for z in 0:lattice.Nz-1
            for y in 0:lattice.Ny-1
                push!(edges, (pos_dict[(lattice.Nx-1, y, z)], pos_dict[(0, y, z)]))
            end
        end
    end
    if lattice.yperiodic
        for z in 0:lattice.Nz-1
            for x in 0:lattice.Nx-1
                push!(edges, (pos_dict[(x, lattice.Ny-1, z)], pos_dict[(x, 0, z)]))
            end
        end
    end
    if lattice.zperiodic
        for x in 0:lattice.Nx-1
            for y in 0:lattice.Ny-1
                push!(edges, (pos_dict[(x, y, lattice.Nz-1)], pos_dict[(x, y, 0)]))
            end
        end
    end

    return edges
end
