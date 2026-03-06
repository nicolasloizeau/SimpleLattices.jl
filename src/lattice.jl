struct UnitCell{D}
    vectors::NTuple{D, NTuple{D, Float64}}
    sites::Vector{NTuple{D, Float64}}
    edges::Vector{Tuple{Int, NTuple{D, Int}, Int}}
end


struct Lattice{D}
    cell::UnitCell{D}
    size::NTuple{D, Int}
    periodicity::NTuple{D, Bool}
end
