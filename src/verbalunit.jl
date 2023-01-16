"""Parse delimited string `s` into a `VerbalUnitAnnotation`.
$(SIGNATURES)
"""
function verbalunit(s, ortho::O; delimiter = "|", threshhold = 1.0, strict = true) where O <: LatinOrthographicSystem
	parts = split(s, delimiter)

	syntype =  if parts[2] == "nothing"
		nothing
	else
		tidiedup = validatedvutype(string(parts[2]), threshhold = threshhold)
	 	if  isnothing(tidiedup)
		
			if strict
				throw(DomainError(parts[2], "Invalid value for syntactic type of verbal expression  $(parts[1]): $(parts[2])"))
			else
				@error("Invalid value for syntactic type of verbal expression  $(parts[1]): $(parts[2])")
				tidiedup
			end

		else
			tidiedup
		end
	end
	semtype =  if parts[3] == "nothing"
		nothing
	else
		tidiedup = validatedverbsemantics(string(parts[3]), threshhold = threshhold)
	 	if  isnothing(tidiedup)
			
			if strict
				throw(DomainError(parts[3], "Invalid value for semantic type of verbal expression $(parts[1]): $(parts[3])"))
			else
				@error("Invalid value for semantic type of verbal expression  $(parts[1]): $(parts[3])")
				tidiedup
			end
		else
			tidiedup
		end
	end

	VerbalUnitAnnotation(parts[1],
		syntype,
		semtype,
		parse(Int, parts[4]),
		CtsUrn(parts[5])
	)
end

"""Parse delimited string `s` into a `VerbalUnitAnnotation`.
$(SIGNATURES)
"""
function verbalunit(s; delimiter = "|", threshhold = 1.0, strict = true)
	verbalunit(s, literaryGreek(), delimiter = delimiter, threshhold = threshhold, strict = strict)
end


"""Return a validated string value for the syntactic type of a verbal expression, or `nothing`
if `s` fails to satisfy matching criteria.
$(SIGNATURES)
"""
function validatedvutype(s::T; threshhold = 1.0) where T <: AbstractString
    validatedform(s, vutypes, threshhold =  threshhold)
end


"""Return a validated string value for the semantics of a verbal expression, or `nothing`
if `s` fails to satisfy matching criteria.
$(SIGNATURES)
"""
function validatedverbsemantics(s::T; threshhold = 1.0) where T <: AbstractString
    validatedform(s, verbsemantics, threshhold =  threshhold)
end

#=
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

=#