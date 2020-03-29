module MyRDatasets
using Reexport, CSV
using Pkg.Artifacts
@reexport using DataFrames

export dataset, document

global __datasets = nothing

let
    artifact_toml = joinpath(@__DIR__, "../Artifacts.toml")
    datasets_hash = artifact_hash("datasets", artifact_toml)
    const global DATASETS_DIR = joinpath(artifact_path(datasets_hash), "vincentarelbundock-Rdatasets-e523e67")
end

include("dataset.jl")
include("datasets.jl")

end  # module
