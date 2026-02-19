
function SimpleLattices.plot_lattice(lattice::AbstractLattice2D)
    fig = Figure()
    ax = Axis(fig[1, 1], aspect = DataAspect())
    pos = positions(lattice)
    pos = collect.(pos) |> vcat
    pos = reduce(vcat, transpose.(pos))
    scatter!(
        ax,
        pos[:, 1],
        pos[:, 2],
        markersize = 15,
        color = :red
    )
    for edge in edges(lattice)
        p1 = pos[edge[1], :]
        p2 = pos[edge[2], :]
        lines!(ax, [p1[1], p2[1]], [p1[2], p2[2]], color=:blue)
    end
    for i in 1:size(pos, 1)
        text!(
            ax,
            string(i),
            position = (
                pos[i,1],
                pos[i,2]
            ),
            align = (:center, :bottom),
            fontsize = 14,
            color = :black
        )
    end
    return fig
end

function SimpleLattices.plot_lattice(lattice::AbstractLattice3D)
    fig = Figure()
    ax = Axis3(fig[1, 1], aspect = :data)
    pos = positions(lattice)
    pos = collect.(pos) |> vcat
    pos = reduce(vcat, transpose.(pos))
    scatter!(
        ax,
        pos[:, 1],
        pos[:, 2],
        pos[:, 3],
        markersize = 15,
        color = :red
    )
    for edge in edges(lattice)
        p1 = pos[edge[1], :]
        p2 = pos[edge[2], :]
        lines!(ax, [p1[1], p2[1]], [p1[2], p2[2]], [p1[3], p2[3]], color=:blue)
    end
    for i in 1:size(pos, 1)
        text!(
            ax,
            string(i),
            position = (
                pos[i,1],
                pos[i,2],
                pos[i,3]
            ),
            align = (:center, :bottom),
            fontsize = 14,
            color = :black
        )
    end
    return fig
end
