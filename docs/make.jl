# Build docs from repository root, e.g. with
# 
#    julia --project=docs/ docs/make.jl
#
# Serve docs from repository root:
#
#   julia -e 'using LiveServer; serve(dir="docs/build")'
#
using Pkg
Pkg.activate(".")
Pkg.resolve()
Pkg.instantiate()

using Documenter, DocStringExtensions, LatinSyntax

makedocs(
    sitename = "LatinSyntax.jl Documentation",
    pages = [
        "Home" => "index.md"
    ]
)

deploydocs(
    repo = "github.com/neelsmith/LatinSyntax.jl.git",
) 
