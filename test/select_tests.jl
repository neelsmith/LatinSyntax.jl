using Pkg
Pkg.activate("..")

using  LatinSyntax
using GreekSyntax
using CitableCorpus, CitableBase, CitableText
using Orthography, LatinOrthography

using Test
using TestSetExtensions



@testset "All the tests" begin
    println(map(s -> replace(s, r".jl$" => ""), ARGS))
    @includetests map(s -> replace(s, r".jl$" => ""), ARGS)
end
