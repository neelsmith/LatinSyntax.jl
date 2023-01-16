
"""Parse delimited string `s` into a `TokenAnnotation`.
$(SIGNATURES)
"""
function token(s::T, ortho::O; delimiter = "|", threshhold = 1.0, strict = true) where {T <: AbstractString, O <: LatinOrthographicSystem }
	parts = split(s, delimiter)
	urn = parts[1] == "nothing" ? nothing : CtsUrn(parts[1])

	# 5-8 are optional pairs of an integer index + a controlled vocabulary term
	#@warn("Ints for $(s): $(parts[5]), $(parts[7])")
	node1 = parts[5] == "nothing" || isempty(parts[5]) ? nothing : parse(Int, parts[5])
	node2 = parts[7] == "nothing" || isempty(parts[7]) ? nothing : parse(Int, parts[7])

	node1rel =  if parts[6] == "nothing"
		nothing
	else
		tidiedup = validatedrelation(string(parts[6]), threshhold = threshhold)
	 	if  isnothing(tidiedup)
			if strict
				throw(DomainError(parts[6], "Invalid value for syntactic relation: $(parts[6])"))
			else
				if strict
					throw(DomainError(parts[6], "Invalid value for syntactic relation: $(parts[6])") )
				else
					@error("Invalid value for syntactic relation: $(parts[6])")
					tidiedup
				end
				tidiedup
			end
		else
			tidiedup
		end
	end
	node2rel =   if parts[8] == "nothing"
		nothing
	else
		tidiedup = validatedrelation(string(parts[8]), threshhold = threshhold)
	 	if  isnothing(tidiedup)
			if strict
				throw(DomainError(parts[8], "Invalid value for syntactic relation: $(parts[8])"))
			else
				if strict
					throw(DomainError(parts[8], "Invalid value for syntactic relation: $(parts[8])") )
				else
					@error("Invalid value for syntactic relation: $(parts[8])")
					tidiedup
				end
				tidiedup
			end
		else
			tidiedup
		end
	end

	TokenAnnotation(
		urn,
		parts[2],
		parts[3],
		parts[4],
		node1,
		node1rel,
		node2,
		node2rel
	)
end


"""Parse delimited string `s` into a `TokenAnnotation`.
$(SIGNATURES)
"""
function token(s::T; delimiter = "|", threshhold = 1.0, strict = true) where T <: AbstractString
	token(s, literaryGreek(), delimiter = delimiter, threshhold = threshhold, strict = strict)
end



"""Return a validated string value for syntactic relation between two tokens, or `nothing`
if `s` fails to satisfy matching criteria.
$(SIGNATURES)
"""
function validatedrelation(s::T; threshhold = 1.0) where T <: AbstractString
    validatedform(s, syntaxrelations, abbrdict = syntaxdict,  threshhold =  threshhold)
end




#=
function token(s, ortho::T; delimiter = "|", threshhold = 1.0) where T <: LatinOrthographicSystem
	parts = split(s, delimiter)
	if length(parts)!= 8
		@error("Invalid syntax for delimited line $(s)")
	end
	urn = CtsUrn(parts[1])
	ttype = LatinSyntax.validatetokentype(parts[2])
	txt = parts[3]
	vu = parts[4]
	node1 = parts[5] == "nothing" || isempty(parts[5]) ? nothing : parse(Int, parts[5])
	node2 = parts[7] == "nothing" || isempty(parts[7]) ? nothing : parse(Int, parts[7])

	node1relation = parts[6] == "nothing" || isempty(parts[6]) ? nothing : validatetokentype(parts[6])
	node2relation = parts[8] == "nothing" || isempty(parts[8]) ? nothing : validatetokentype(parts[8])
	TokenAnnotation(urn,
		ttype,
		txt,
		vu,
		node1,
		node1relation,
		node2,
		node2relation
	)
end


function validatetokentype(s)
	s
end
=#