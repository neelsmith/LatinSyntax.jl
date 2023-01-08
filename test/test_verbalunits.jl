@testset "Test parsing a VerbalUnitAnnotation from delimited source" begin
    #vuid|syntactic_type|semantic_type|depth|sentence
    src = "108a.1.1-108a.1.28a.1|independent clause|transitive|1|urn:cts:latinLit:stoa1263.stoa001.hc_tokens:108a.1.1-108a.1.28a"
    vua = verbalunit(src, latin23())
    @test vua isa VerbalUnitAnnotation

    output = delimited(vua)
    @test output == src
end

#=

Achiui cum per decem annos Troiam capere non possent, Epeus monitu Mineruae equum mirae magnitudinis ligneum fecit, eo-que sunt collecti Menelaus Ulixes Diomedes Thessander Sthenelus Acamas Thoas Machaon Neoptolemus; et in equo scripserunt DANAI MINERUAE DONO DANT, castra-que transtulerunt Tenedo.
=#