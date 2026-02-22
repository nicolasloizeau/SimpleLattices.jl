
using GLMakie
using SimpleLattices


lattice = TriangularLattice(5, 4, true, true)
fig = plot_lattice(lattice;edges=periodic_boundary_edges)
println(edges(lattice))

save("lattice.png", fig)
