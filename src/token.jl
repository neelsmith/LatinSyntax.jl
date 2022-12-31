struct TokenAnalysis
	urn::CtsUrn
	tokentype
	text
	verbalunit
	node1
	node1relation
	node2
	node2relation
end


function delimited(ta::TokenAnalysis; delimiter = "|")
	string(ta.urn, delimiter,
	ta.tokentype, delimiter,
	ta.text, delimiter,
	ta.verbalunit, delimiter,
	ta.node1, delimiter,
	ta.node1relation, delimiter,
	ta.node2, delimiter,
	ta.node2relation)
end


function delimited(vect::Vector{TokenAnalysis}; delimiter = "|")
	hdr = "urn$(delimiter)tokentype$(delimiter)text$(delimiter)verbalunit$(delimiter)node1$(delimiter)node1relation$(delimiter)node2$(delimiter)node2relation\n"
	hdr * join(map(tkn -> delimited(tkn), vect), "\n") * "\n"
end


function token(s; delimiter = "|")
	parts = split(s, delimiter)
	if length(parts)!= 8
		@error("Invalid syntax for delimited line $(s)")
	end
	urn = CtsUrn(parts[1])
	ttype = validatetokentype(parts[2])
	txt = parts[3]
	vu = parts[4]
	node1 = parts[5] == "nothing" || isempty(parts[5]) ? nothing : parts[5]
	node1relation = parts[6] == "nothing" || isempty(parts[6]) ? nothing : parts[6]
	node2 = parts[7] == "nothing" || isempty(parts[7]) ? nothing : parts[7]
	node2relation = parts[8] == "nothing" || isempty(parts[8]) ? nothing : parts[8]
	TokenAnalysis(urn,
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
