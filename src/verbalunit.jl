struct VerbalUnitAnalysis
    sentence::CtsUrn
	id
	syntactic_type
	semantic_type
	depth::Int
end


function verbalunit(s; delimiter = "|")
	parts = split(s, delimiter)
	if length(parts) != 5
		@error("Bad syntax to delimited line $(s)")
	else
		sentence = CtsUrn(parts[1])
		id = parts[2]
		syntype = validatesyntactictype(parts[3])
		semtype = validatesemantictype(parts[4])
		depth = parse(Int, parts[5])
		VerbalUnitAnalysis(sentence, id, syntype, semtype, depth)
	end
end

function validatesyntactictype(s)
	s
end

function validatesemantictype(s)
	s
end


function delimited(vua::VerbalUnitAnalysis; delimiter = "|")
	string(vua.sentence, delimiter, 
	vua.id,delimiter,vua.syntacic_type, delimiter, 
	vua.semantic_type, delimiter,
	vua.depth)
end

