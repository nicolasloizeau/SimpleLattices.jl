
using CairoMakie
using SimpleLattices

# a hexagonal with periodic boundary conditions along x and open boundary conditions along y
L = HexagonalLattice(5, 6; periodic=(true, false))
println(edges(L))
fig = plot_lattice(L)
display(fig)
save("lattice.png", fig)
sleep(1000)
