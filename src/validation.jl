"Authority list for type of verbal expression"
vutypes = [
    "independent clause",
    "subordinate clause",
    "indirect statement",
    "circumstantial participle",
    "gerundive",
    "supine",
    "quote",
    "aside"
]

"Authority list for sematnic type of verbs."
verbsemantics = [
    "transitive", 
    "intransitive", 
    "linking"
]


"Authority list for syntactic relation between tokens."
syntaxrelations = [
    "conjunction", 
    "subordinate conjunction", 

    "unit verb", 
    "compound verb", 
    "complementary infinitive", 
    
    
    "subject", 
    "object", 
    "predicate", 
    "absolute", 
    "agent", 
    "dative",
    "ablative",

    "adverbial", 

    "attributive", 
    "object of preposition", 
    "genitive", 
    "appositive" 
    
]


"Abbreviation dictionary for syntactic relations"
syntaxdict = Dict(
    "op" => "object of preposition",
    "sc" => "subordinate conjunction",
    "o" => "object",
    "s" => "subject",
    "v" => "unit verb",
    "cv" => "compound verb",
    "ci" => "complemntary infinitive"
)