
using GLMakie
using SimpleLattices

Nx = 2
Ny = 3
Nz = 4
lattice = CubicLattice(Nx, Ny, Nz, true, true, true)
println(edges(lattice))



# println(typeof(L)<:AbstractLattice3D)

# fig = plot_lattice(L)
# display(fig)
# sleep(10^9)
