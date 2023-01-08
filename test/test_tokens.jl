@testset "Test delimited representation of tokens" begin
    src = "urn:cts:latinLit:stoa1263.stoa001.hc_tokens:108a.1.1|lexical|Achiui|108a.1.1-108a.1.28a.9|9|subject|nothing|nothing"
    tkn = token(src, latin23())
	@test tkn isa TokenAnnotation
    @test delimited(tkn) == src

end

#=
urn,
ttype,
		txt,
		vu,
		node1,
		node1relation,
		node2,
		node2relation
=#

#=

Achiui cum per decem annos Troiam capere non possent, Epeus monitu Mineruae equum mirae magnitudinis ligneum fecit, eo-que sunt collecti Menelaus Ulixes Diomedes Thessander Sthenelus Acamas Thoas Machaon Neoptolemus; et in equo scripserunt DANAI MINERUAE DONO DANT, castra-que transtulerunt Tenedo.
=#