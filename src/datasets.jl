function datasets(package_name::AbstractString)
	d = datasets()
	d[findall(isequal(package_name), d[:, :Package]), :]
end

function datasets()
    if MyRDatasets.__datasets === nothing
        path = joinpath(DATASETS_DIR, "datasets.csv")
        global __datasets = CSV.read(path)
    end
    return MyRDatasets.__datasets::DataFrame
end
