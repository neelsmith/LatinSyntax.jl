module LatinSyntax
using GreekSyntax
import GreekSyntax: sentence
import GreekSyntax: verbalunit
import GreekSyntax: token
using CitableText
using CitableCorpus
using Orthography, LatinOrthography


using Documenter
using DocStringExtensions


include("authlists.jl")
include("sentences.jl")
include("verbalunit.jl")
include("token.jl")

export SentenceAnnotation, parsesentences, sentence
export VerbalUnitAnnotation, verbalunit
export TokenAnnotation, token

export delimited

end # module LatinSyntax
