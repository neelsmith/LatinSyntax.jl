"""Construct a `SentenceAnnotation` object from delimited-text representation.
$(SIGNATURES)
"""
function sentence(s; delimiter = "|")
    parts = split(s, delimiter)
    if length(parts) != 2
        @error("Bad syntax for delimited line $(s)")
    else
        rng = CtsUrn(parts[1])
        seq = parse(Int, parts[2])
        SentenceAnnotation(rng, seq)
    end
end


terminators = [".", ":", ";"]
