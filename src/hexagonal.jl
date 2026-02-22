


struct HexagonalLattice <: AbstractLattice2D
    Nx::Int
    Ny::Int
    xperiodic::Bool
    yperiodic::Bool
    # TODO: add periodic boundary conditions
end

function HexagonalLattice(Nx::Int, Ny::Int; xperiodic::Bool=false, yperiodic::Bool=false)
    if xperiodic || yperiodic
        error("Periodic boundary conditions not implemented for HexagonalLattice yet")
    end
    return HexagonalLattice(Nx, Ny, false, false)
end


Base.length(lattice::HexagonalLattice) = (lattice.Nx+1) * lattice.Ny*2 + lattice.Nx*2
Base.size(lattice::HexagonalLattice) = (lattice.Nx, lattice.Ny)

sites(lattice::HexagonalLattice) = collect(1:length(lattice))

function diagright_edges(lattice::HexagonalLattice)
    positions = positions_int(lattice)
    pos_dict = Dict(p => i for (i, p) in enumerate(positions))
    edges = []
    for ny in 3:2:(lattice.Ny+1)*2-2
        for nx in 1:lattice.Nx+1
            u = pos_dict[(nx, ny)]
            v = pos_dict[(nx, ny+1)]
            push!(edges, (u, v))
        end
    end
    # lower boundary
    ny = 1
    for nx in 2:lattice.Nx+1
        u = pos_dict[(nx, ny)]
        v = pos_dict[(nx, ny+1)]
        push!(edges, (u, v))
    end
    # upper boundary
    ny = (lattice.Ny+1)*2
    for nx in 1:lattice.Nx
        u = pos_dict[(nx, ny)]
        v = pos_dict[(nx, ny-1)]
        push!(edges, (u, v))
    end
    return edges
end


function diagleft_edges(lattice::HexagonalLattice)
    positions = positions_int(lattice)
    pos_dict = Dict(p => i for (i, p) in enumerate(positions))
    edges = []
    for ny in 3:2:(lattice.Ny+1)*2-2
        for nx in 2:lattice.Nx+1
            u = pos_dict[(nx, ny)]
            v = pos_dict[(nx-1, ny+1)]
            push!(edges, (u, v))
        end
    end
    # lower boundary
    ny = 1
    for nx in 2:lattice.Nx+1
        u = pos_dict[(nx, ny)]
        v = pos_dict[(nx-1, ny+1)]
        push!(edges, (u, v))
    end
    # upper boundary
    ny = (lattice.Ny+1)*2
    for nx in 1:lattice.Nx
        u = pos_dict[(nx, ny)]
        v = pos_dict[(nx+1, ny-1)]
        push!(edges, (u, v))
    end



    return edges
end

function vertical_edges(lattice::HexagonalLattice)
    positions = positions_int(lattice)
    pos_dict = Dict(p => i for (i, p) in enumerate(positions))
    edges = []
    for ny in 2:2:(lattice.Ny+1)*2-2
        for nx in 1:lattice.Nx+1
            u = pos_dict[(nx, ny)]
            v = pos_dict[(nx, ny+1)]
            push!(edges, (u, v))
        end
    end
    return edges
end

function edges(lattice::HexagonalLattice)
    e = vertical_edges(lattice)
    append!(e, diagright_edges(lattice))
    append!(e, diagleft_edges(lattice))
    return e
end



function positions_int(lattice::HexagonalLattice)
    pos = []
    for nx in 2:lattice.Nx+1
        push!(pos, (nx, 1))
    end
    for ny in 2:(lattice.Ny+1)*2-1
        for nx in 1:lattice.Nx+1
            push!(pos, (nx, ny))
        end
    end
    for nx in 1:lattice.Nx
        push!(pos, (nx, (lattice.Ny+1)*2))
    end
    return pos
end


function positions(lattice::HexagonalLattice)
    pos = []
    theta = pi/6
    for (nx, ny) in positions_int(lattice)
        dx = div(ny, 2)*cos(theta)
        y = div(ny, 2)*(1+sin(theta))+mod(ny, 2)*2*sin(theta)
        x = nx*cos(theta)*2+dx
        push!(pos, (x,y))
    end
    return pos
end
