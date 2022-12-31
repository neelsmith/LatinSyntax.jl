@testset "Test parsing a citable corpus into sentences" begin

        u1 = CtsUrn("urn:cts:latinLit:stoa1263.stoa001.hc:108a.1")
        t1 = "Achiui cum per decem annos Troiam capere non possent, Epeus monitu Mineruae equum mirae magnitudinis ligneum fecit, eo-que sunt collecti Menelaus Ulixes Diomedes Thessander Sthenelus Acamas Thoas Machaon Neoptolemus; et in equo scripserunt DANAI MINERUAE DONO DANT, castraque transtulerunt Tenedo."
        u2 = CtsUrn("urn:cts:latinLit:stoa1263.stoa001.hc:108a.2")
        t2 = "id Troiani cum uiderunt arbitrati sunt hostes abisse; Priamus equum in arcem Mineruae duci imperauit, feriati-que magno opere ut essent edixit; id uates Cassandra cum uociferaretur, inesse hostes, fides ei habita non est."
        p1  = CitablePassage(u1, t1)
        p2 = CitablePassage(u2, t2)
        c = CitableTextCorpus([p1, p2])

        sents = parsesentences(c, latin23())
        @test length(sents) == 5
        @test map(s -> s.sequence, sents) == [1,2,3,4,5]
        @test sents[1].tokenrange == CtsUrn("urn:cts:latinLit:stoa1263.stoa001.hc_tokens:108a.1.1-108a.1.28a")
        @test sents[end].tokenrange == CtsUrn("urn:cts:latinLit:stoa1263.stoa001.hc_tokens:108a.2.21-108a.2.32a")
end

@testset "Test parsing a SentenceAnalysis from delimited source" begin
        src = "urn:cts:latinLit:stoa1263.stoa001.hc_tokens:108a.1.1-108a.1.28a|1"
        sa = sentence(src)
        @test sa isa SentenceAnalysis
end