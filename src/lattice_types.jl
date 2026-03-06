
const SQUARE_CELL = UnitCell(
    ((1.0,0.0), (0.0,1.0)),
    [(0.0,0.0)],
    [(1, (0,1), 1),
     (1, (1,0), 1)]
)
"""
    SquareLattice(Nx, Ny; periodic=(false, false))

Create a square lattice with Nx sites in the x direction and Ny sites in the y direction. The `periodic` keyword argument specifies whether the lattice is periodic in the x and y directions, respectively.
"""
SquareLattice(Nx, Ny; periodic=(false, false)) = Lattice(SQUARE_CELL, (Nx, Ny), periodic)

const CUBIC_CELL = UnitCell(
    ((1.0,0.0,0.0), (0.0,1.0,0.0), (0.0,0.0,1.0)),
    [(0.0,0.0,0.0)],
    [(1, (1,0,0), 1),
     (1, (0,1,0), 1),
     (1, (0,0,1), 1)]
)


"""
    CubicLattice(Nx, Ny, Nz)

Create a cubic lattice of size (Nx, Ny, Nz).
Periodic boundary conditions are not implemented for 3D lattices at the moment.
"""
CubicLattice(Nx, Ny, Nz) = Lattice(CUBIC_CELL, (Nx, Ny, Nz), periodic)


const TRIANGULAR_CELL = UnitCell(
    ((1.0,0.0), (0.5,sqrt(3)/2)),
    [(0.0,0.0)],
    [(1, (1,0), 1),
     (1, (0,1), 1),
     (1, (-1,1), 1)]
)

"""
     TriangularLattice(Nx, Ny; periodic=(false, false))

Create a triangular lattice of size (Nx, Ny). The `periodic` keyword argument specifies whether the lattice is periodic in the x and y directions, respectively.
"""
TriangularLattice(Nx, Ny; periodic=(false, false)) = Lattice(TRIANGULAR_CELL, (Nx, Ny), periodic)


const HEXAGONAL_CELL = UnitCell(
    ((1.0,0.0), (0.5,sqrt(3)/2)),
    [(0.0,0.0),
     (0.5, sqrt(3)/6)],
    [
     (1, (0,0), 2),
     (1, (-1,0), 2),
     (1, (0,-1), 2),
    ]
)
"""
    HexagonalLattice(Nx, Ny; periodic=(false, false))

Create a hexagonal lattice of size (Nx, Ny). The `periodic` keyword argument specifies whether the lattice is periodic in the x and y directions, respectively.
"""
HexagonalLattice(Nx, Ny; periodic=(false, false)) = Lattice(HEXAGONAL_CELL, (Nx, Ny), periodic)



const KAGOME_CELL = UnitCell(
    ((1.0,0.0), (0.5,sqrt(3)/2)),

    [(0.0, 0.0),                 # 1
     (0.5, 0.0),                 # 2
     (0.25, sqrt(3)/4)],         # 3

    [
     # intra-cell
     (1, (0,0), 2),
     (1, (0,0), 3),
     (2, (0,0), 3),

     # inter-cell
     (1, (-1,0), 2),
     (1, (0,-1), 3),
     (2, (1,-1), 3)
    ]
)


"""
    KagomeLattice(Nx, Ny; periodic=(false, false))

Create a kagome lattice of size (Nx, Ny). The `periodic` keyword argument specifies whether the lattice is periodic in the x and y directions, respectively.
"""
KagomeLattice(Nx, Ny; periodic=(false, false)) = Lattice(KAGOME_CELL, (Nx, Ny), periodic)
