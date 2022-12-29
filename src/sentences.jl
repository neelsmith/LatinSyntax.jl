struct SentenceAnalysis
    tokenrange::CtsUrn
    sequence::Int
end

"""Tokenize corpus `c` using orthography `ortho`, and group the tokens into sentence units.
"""
function parsesentences(c, ortho::T; terminators = [".", ":", ";"]) where T <: OrthographicSystem
	tokens = tokenize(c, ortho)

	sentencelist = SentenceAnalysis[]
    
    currenttext = c.passages[1].urn |> droppassage
    sentencecount = 0
	rangeopener = ""	
	for n in tokens
        if droppassage(n[1].urn) != currenttext
            currenttext = droppassage(n[1].urn)
            sentencecount = 0
            if ! isempty(rangeopener)
                rangeu = addpassage(currenttext, string(rangeopener, "-", 	passagecomponent(n[1].urn)))
            end
        end

    	if n[1].text in terminators
            sentencecount = sentencecount + 1
            if isempty(rangeopener)
                @error("Syntax error: empty sentence at token $(n)")
            end
        	rangeu = addpassage(currenttext, string(rangeopener, "-", 	passagecomponent(n[1].urn)))
            push!(sentencelist,  SentenceAnalysis(rangeu, sentencecount))
	        #push!(sentenceurls, rangeu)

			
	    else
			if isempty(rangeopener)
	        	rangeopener = passagecomponent(n[1].urn)
	    	end
			
		end
	end
	sentencelist
end