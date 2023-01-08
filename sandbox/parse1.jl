using LatinSyntax
using CitableBase, CitableCorpus

f = joinpath(pwd(), "test", "data", "texts", "hyginus.cex")
c = fromcex(f, CitableTextCorpus, FileReader)

using Orthography, LatinOrthography
sents = parsesentences(c, latin23())