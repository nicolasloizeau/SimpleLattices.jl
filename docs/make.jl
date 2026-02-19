using CairoMakie
CairoMakie.set_theme!(screen = (; visible=false), px_per_unit=4)
using SimpleLattices
using Documenter


DocMeta.setdocmeta!(SimpleLattices, :DocTestSetup, :(using SimpleLattices); recursive=true)

makedocs(;
    modules=[SimpleLattices],
    authors="Nicolas Loizeau",
    sitename="SimpleLattices.jl",
    format=Documenter.HTML(;
        canonical="https://nicolasloizeau.github.io/SimpleLattices.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "SquareLattice" => "square.md",
        "CubicLattice" => "cubic.md",
    ],
)

deploydocs(;
    repo="github.com/nicolasloizeau/SimpleLattices.jl",
    devbranch="main",
)
