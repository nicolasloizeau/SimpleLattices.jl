

"""
    positions(lattice::Lattice)

Returns a vector of the positions of all sites in the lattice.
The positions are ordered like [`sites`](@ref).
"""
function positions(lattice::Lattice{N}) where {N}
    cell  = lattice.cell
    sizes = lattice.size
    site_positions = typeof(cell.sites[1])[]
    ranges = ntuple(d -> 0:sizes[d]-1, N)
    M = length(cell.sites[1])
    # Reverse to match nested-loop ordering
    for coord_rev in Iterators.product(reverse(ranges)...)
        coord = reverse(coord_rev)
        for site in cell.sites
            pos = ntuple(i -> begin
                acc = site[i]
                for d in 1:N
                    acc += coord[d] * cell.vectors[d][i]
                end
                acc
            end, M)
            push!(site_positions, pos)
        end
    end
    return site_positions
end


function site_index(lattice::Lattice{2}, i::Int, j::Int, k::Int)
    size = lattice.size
    return (i*size[2]+j)*length(lattice.cell.sites) + k
end

function site_index(lattice::Lattice{3}, i::Int, j::Int, k::Int, l::Int)
    size = lattice.size
    return ((i*size[2]+j)*size[3]+k)*length(lattice.cell.sites) + l
end

"""
    sites(lattice::Lattice)

Return a list of sites indexes.
"""
function sites(lattice::Lattice{N}; site_indexes=1:length(lattice.cell.sites)) where {N}
    sizes = lattice.size
    indexes = Vector{Int}()
    ranges = ntuple(d -> 0:sizes[d]-1, N)
    # Reverse to match nested-loop ordering
    for coord_rev in Iterators.product(reverse(ranges)...)
        coord = reverse(coord_rev)
        for s in site_indexes
            push!(indexes, site_index(lattice, coord..., s))
        end
    end
    return indexes
end


@inline function wrap_index(x::Int, L::Int, periodic::Bool)
    if 0 <= x < L
        return x, true
    elseif periodic
        return mod(x, L), true
    else
        return x, false
    end
end



"""
    edges(lattice::Lattice; edge_indexes=1:length(lattice.cell.edges))

Returns a list of edges in the lattice, where each edge is represented as a couple of site indexes.

"""
function edges(lattice::Lattice{N}; edge_indexes=1:length(lattice.cell.edges)) where N
    cell = lattice.cell
    size = lattice.size
    periodicity = lattice.periodicity
    edge_list = Tuple{Int,Int}[]
    ranges = ntuple(d -> 0:size[d]-1, N)
    for coord in CartesianIndices(ranges)
        base = Tuple(coord)
        for (site1, disp, site2) in cell.edges[edge_indexes]
            valid = true
            newcoord = ntuple(N) do d
                x, ok = wrap_index(base[d] + disp[d], size[d], periodicity[d])
                valid &= ok
                x
            end
            if valid
                index1 = site_index(lattice, base..., site1)
                index2 = site_index(lattice, newcoord..., site2)

                push!(edge_list, (index1, index2))
            end
        end
    end
    return remove_bidirectional(edge_list)
end


function remove_bidirectional(edges)
    edges = sort.(collect.(edges))
    unique_edges = unique(edges)
    return unique_edges
end
