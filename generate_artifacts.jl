using Pkg.Artifacts
using Pkg.PlatformEngines
using SHA

artifacts_toml = joinpath(@__DIR__, "Artifacts.toml")

datasets_hash = artifact_hash("datasets", artifacts_toml)

if datasets_hash === nothing || !artifact_exists(datasets_hash)
    datasets_url = "https://github.com/vincentarelbundock/Rdatasets/tarball/master/vincentarelbundock-Rdatasets-e523e67.tar.gz"
    tarball = joinpath(tempdir(), "rdatasets.tar.gz")

    println(tarball)

    download(datasets_url, tarball)

    sha256hash = open(tarball) do f
        bytes2hex(sha256(f))
    end

    probe_platform_engines!()
    datasets_hash = create_artifact() do artifact_dir
        unpack(tarball, artifact_dir)
    end

    rm(tarball)

    bind_artifact!(artifacts_toml, "datasets", datasets_hash,
                   download_info = [(datasets_url, sha256hash)],
                   force = true)
end
