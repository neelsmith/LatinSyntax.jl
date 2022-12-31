@testset "Test parsing a VerbalUnitAnalysis from delimited source" begin
    src = "urn:cts:latinLit:stoa1263.stoa001.hc_tokens:108a.1.1-108a.1.28a|108a.1.1-108a.1.28a.1|independent clause|transitive|1"
    vua = verbalunit(src)
    @test sa isa SentenceAnalysis
end

#=
    sentence::CtsUrn
	id
	syntactic_type
	semantic_type
	depth::Int
=#
#=

Achiui cum per decem annos Troiam capere non possent, Epeus monitu Mineruae equum mirae magnitudinis ligneum fecit, eo-que sunt collecti Menelaus Ulixes Diomedes Thessander Sthenelus Acamas Thoas Machaon Neoptolemus; et in equo scripserunt DANAI MINERUAE DONO DANT, castra-que transtulerunt Tenedo.
=#