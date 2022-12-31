module LatinSyntax
using CitableText
using CitableCorpus
using Orthography, LatinOrthography

using Documenter
using DocStringExtensions

include("sentences.jl")
include("verbalunit.jl")
include("token.jl")

export SentenceAnalysis, parsesentences, sentence
export VerbalUnitAnalysis, verbalunit

export delimited

end # module LatinSyntax
