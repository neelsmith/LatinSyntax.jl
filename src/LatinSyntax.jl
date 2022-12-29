module LatinSyntax
using CitableText
using CitableCorpus
using Orthography, LatinOrthography

include("sentences.jl")
include("verbalunit.jl")
include("token.jl")

export SentenceAnalysis, parsesentences
end # module LatinSyntax
