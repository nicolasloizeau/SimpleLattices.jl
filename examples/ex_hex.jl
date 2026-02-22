
using CairoMakie
using SimpleLattices


L = HexagonalLattice(5, 6, false, false)
println(edges(L))
# println(edges(L))

println(typeof(L)<:AbstractLattice2D)

fig = plot_lattice(L)
# display(fig)
save("lattice.png", fig)

# sleep(10^9)
