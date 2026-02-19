
using CairoMakie
using SimpleLattices





L = SquareLattice(2, 4, true, true)
println(edges(L))

println(typeof(L)<:AbstractLattice2D)

fig = plot_lattice(L)
display(fig)
sleep(10^9)
