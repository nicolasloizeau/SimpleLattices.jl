
using GLMakie
using SimpleLattices


L = CubicLattice(2, 3, 4, true, true, true)

println(edges(L))

println(typeof(L)<:AbstractLattice3D)

fig = plot_lattice(L)
display(fig)
sleep(10^9)
