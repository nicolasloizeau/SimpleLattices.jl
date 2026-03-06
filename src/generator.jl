

"""
    positions(lattice::Lattice{N}) where {N}

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


function site_indexes(lattice::Lattice{N}) where {N}
    sizes = lattice.size
    indexes = Vector{Int}()
    ranges = ntuple(d -> 0:sizes[d]-1, N)
    # Reverse to match nested-loop ordering
    for coord_rev in Iterators.product(reverse(ranges)...)
        coord = reverse(coord_rev)
        for s in 1:length(lattice.cell.sites)
            push!(indexes, site_index(lattice, coord..., s))
        end
    end
    return indexes
end

"""
    sites(lattice::Lattice{N}) where {N}

Return a list of sites indexes.
"""
function sites(lattice::Lattice{N}) where {N}
    return site_indexes(lattice)
end


"""
    edges(lattice::Lattice{N}) where {N}

Returns a list of edges in the lattice, where each edge is represented as a couple of site indexes.
"""
function edges(lattice::Lattice{2})
    cell = lattice.cell
    size = lattice.size
    periodicity = lattice.periodicity
    edge_list = []
    for i in 0:size[1]-1, j in 0:size[2]-1
        for (site1, (di, dj), site2) in cell.edges
            i2 = i + di
            j2 = j + dj
            index1 = site_index(lattice, i, j, site1)
            index2 = site_index(lattice, i2, j2, site2)
            if (0 <= i2 < size[1]) && (0 <= j2 < size[2])
                push!(edge_list, (index1, index2))
            elseif periodicity[1] && (0 <= j2 < size[2])
                i2 = mod(i2, size[1])
                index1 = site_index(lattice, i, j, site1)
                index2 = site_index(lattice, i2, j2, site2)
                push!(edge_list, (index1, index2))
            elseif periodicity[2] && (0 <= i2 < size[1])
                j2 = mod(j2, size[2])
                index1 = site_index(lattice, i, j, site1)
                index2 = site_index(lattice, i2, j2, site2)
                push!(edge_list, (index1, index2))
            elseif periodicity[1] && periodicity[2]
                i2 = mod(i2, size[1])
                j2 = mod(j2, size[2])
                index1 = site_index(lattice, i, j, site1)
                index2 = site_index(lattice, i2, j2, site2)
                push!(edge_list, (index1, index2))
            end
        end
    end
    return remove_bidirectional(edge_list)
end

function edges(lattice::Lattice{3})
    cell = lattice.cell
    size = lattice.size
    periodicity = lattice.periodicity
    edge_list = []
    for i in 0:size[1]-1, j in 0:size[2]-1, k in 0:size[3]-1
        for (site1, (di, dj, dk), site2) in cell.edges
            i2 = i + di
            j2 = j + dj
            k2 = k + dk
            index1 = site_index(lattice, i, j, k, site1)
            index2 = site_index(lattice, i2, j2, k2, site2)
            if (0 <= i2 < size[1]) && (0 <= j2 < size[2]) && (0 <= k2 < size[3])
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
