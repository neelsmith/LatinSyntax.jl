

```@setup basic
using CitableText, CitableCorpus
u1 = CtsUrn("urn:cts:latinLit:stoa1263.stoa001.hc:108a.1")
t1 = "Achiui cum per decem annos Troiam capere non possent, Epeus monitu Mineruae equum mirae magnitudinis ligneum fecit, eo-que sunt collecti Menelaus Ulixes Diomedes Thessander Sthenelus Acamas Thoas Machaon Neoptolemus; et in equo scripserunt DANAI MINERUAE DONO DANT, castraque transtulerunt Tenedo."
u2 = CtsUrn("urn:cts:latinLit:stoa1263.stoa001.hc:108a.2")
t2 = "id Troiani cum uiderunt arbitrati sunt hostes abisse; Priamus equum in arcem Mineruae duci imperauit, feriati-que magno opere ut essent edixit; id uates Cassandra cum uociferaretur, inesse hostes, fides ei habita non est."
p1  = CitablePassage(u1, t1)
p2 = CitablePassage(u2, t2)
twopassages = CitableTextCorpus([p1, p2])
```


# The `LatinSyntax` package

Here's a tiny citable corpus named `twopassages` with two passages of Hyginus.

```@example basic
typeof(twopassages)
```

```@example basic
map(psg -> psg.text, twopassages.passages)
```

Let's parse it into sentences using the `Latin23` orthography.

```@example basic
using LatinSyntax
using LatinOrthography
parsesentences(twopassages, latin23())
```