struct SentenceAnalysis
    tokenrange::CtsUrn
    sequence::Int
end

"""Construct a `SentenceAnalysis` object from delimited-text representation.
$(SIGNATURES)
"""
function sentence(s; delimiter = "|")
    parts = split(s, delimiter)
    if length(parts) != 2
        @error("Bad syntax for delimited line $(s)")
    else
        rng = CtsUrn(parts[1])
        seq = parse(Int, parts[2])
        SentenceAnalysis(rng, seq)
    end
end


"""Compose delimited-text representation of a `SentenceAnalysis`.
$(SIGNATURES)
"""
function delimited(sa::SentenceAnalysis; delimiter = "|")
    string(sa.tokenrange,delimiter,sa.sequence)
end



"""Compose delimited-text representation of a vector of `SentenceAnalysis`s.
$(SIGNATURES)
"""
function delimited(sentlist::Vector{SentenceAnalysis}; delimiter = "|")
	hdr = "sentence|sequence\n"
	hdr * join(map(s -> delimited(s), sentlist), "\n") * "\n" 
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
	        rangeopener = ""

			
	    else
			if isempty(rangeopener)
	        	rangeopener = passagecomponent(n[1].urn)
	    	end
			
		end
	end
	sentencelist
end