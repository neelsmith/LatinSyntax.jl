
function verbalunit(s, ortho::T; delimiter = "|") where T <: LatinOrthographicSystem
	parts = split(s, delimiter)
	if length(parts) != 5
		@error("Bad syntax to delimited line $(s)")
	else
		sentence = CtsUrn(parts[5])
		id = parts[1]
		syntype = validatesyntactictype(parts[2])
		semtype = validatesemantictype(parts[3])
		depth = parse(Int, parts[4])
		VerbalUnitAnnotation(id, syntype, semtype, depth, sentence)
	end
end

function validatesyntactictype(s)
	s
end

function validatesemantictype(s)
	s
end

