



function SimpleLattices.plot_positions(lattice::Lattice)
    fig = Figure()
    pos = positions(lattice)
    pos = collect.(pos) |> vcat
    pos = reduce(vcat, transpose.(pos))
    dims = size(pos, 2)
    dims in (2, 3) || throw(ArgumentError("Only 2D/3D lattices are supported, got $dims-D"))

    ax = dims == 2 ?
        Axis(fig[1, 1], aspect = DataAspect()) :
        Axis3(fig[1, 1], aspect = :data)

    coords = ntuple(d -> pos[:, d], dims)
    scatter!(ax, coords...; markersize = 15, color = :red)
    return fig
end

function SimpleLattices.plot_lattice(lattice::Lattice; edges::Function=edges)
    fig = Figure()
    pos = positions(lattice)
    pos = collect.(pos) |> vcat
    pos = reduce(vcat, transpose.(pos))
    dims = size(pos, 2)
    dims in (2, 3) || throw(ArgumentError("Only 2D/3D lattices are supported, got $dims-D"))

    ax = dims == 2 ?
        Axis(fig[1, 1], aspect = DataAspect()) :
        Axis3(fig[1, 1], aspect = :data)

    coords = ntuple(d -> pos[:, d], dims)
    scatter!(ax, coords...; markersize = 15, color = :red)

    for edge in edges(lattice)
        p1 = pos[edge[1], :]
        p2 = pos[edge[2], :]
        line_coords = ntuple(d -> [p1[d], p2[d]], dims)
        lines!(ax, line_coords...; color = :blue)
    end

    indexes = sites(lattice)
    for i in 1:size(pos, 1)
        position = dims == 2 ?
            (pos[i, 1], pos[i, 2]) :
            (pos[i, 1], pos[i, 2], pos[i, 3])
        text!(
            ax,
            string(indexes[i]);
            position = position,
            align = (:center, :bottom),
            fontsize = 20,
            color = :black,
        )
    end

    return fig
end
