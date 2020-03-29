function dataset(package_name::AbstractString, dataset_name::AbstractString)
    basename = joinpath(DATASETS_DIR, "csv", package_name)
    csvname = joinpath(basename, string(dataset_name, ".csv"))
    if isfile(csvname)
        return CSV.read(csvname, drop = [1])
    else
        error("Unable to locate dataset file $csvname")
    end
end

function document(package_name::AbstractString, dataset_name::AbstractString)
    basename = joinpath(DATASETS_DIR, "doc", package_name)
    rstname = joinpath(basename, "rst", string(dataset_name, ".rst"))
    if isfile(rstname)
        open(rstfile) do f
            println(f)
        end
    else
        error("Unable to locate dataset file $rstname")
    end
end
