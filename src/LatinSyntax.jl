module LatinSyntax
using CitableText
using CitableCorpus
using Orthography, LatinOrthography

include("sentences.jl")
include("verbalunit.jl")

export parsesentences
end # module LatinSyntax
