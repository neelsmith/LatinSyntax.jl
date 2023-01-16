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
