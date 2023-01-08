module LatinSyntax
using GreekSyntax
using CitableText
using CitableCorpus
using Orthography, LatinOrthography

using Documenter
using DocStringExtensions

include("sentences.jl")
include("verbalunit.jl")
include("token.jl")

export SentenceAnnotation, parsesentences, sentence
export VerbalUnitAnnotation, verbalunit
export TokenAnnotation, token

export delimited

end # module LatinSyntax
