
using CairoMakie
using SimpleLattices


Nx = 5
Ny = 4
lattice = SquareLattice(Nx, Ny, true, true)
println(edges(lattice))
fig = plot_lattice(lattice)

save("lattice.png", fig)
# println(typeof(L)<:AbstractLattice2D)

# fig = plot_lattice(L)
# display(fig)
# sleep(10^9)
