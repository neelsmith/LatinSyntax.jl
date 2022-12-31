### A Pluto.jl notebook ###
# v0.19.19

using Markdown
using InteractiveUtils

# ╔═╡ d3d708ea-5a63-4c9e-9fc2-6801ada726e0
repo = joinpath(pwd(), "..")

# ╔═╡ a4471683-d5cd-4ca4-9f3b-c582427f473b
# ╠═╡ show_logs = false
begin
	using Pkg
	Pkg.activate(repo)
	Pkg.resolve()
	Pkg.instantiate()
	using LatinSyntax
	using CitableBase
	using CitableText
	using CitableCorpus
	using Orthography
	using LatinOrthography
	
end

# ╔═╡ 2a2d0160-8794-11ed-23a7-0d6ff795640e
md"""# Dev. notebook"""

# ╔═╡ 99a2e366-4e46-401b-bae9-241e98425e97
md"""> Working with syntactic objects"""

# ╔═╡ 9b390dfb-1685-4cf8-bd37-2137f277a320
md"""> Parsing a citable corpus into sentences"""

# ╔═╡ d12ab940-f56a-49e0-bedf-b341f2124bc5
f = joinpath(repo, "test", "data", "hyginus.cex")

# ╔═╡ 059b137a-a5ff-4b9e-935b-b00effdf0a9f
c = fromcex(f, CitableTextCorpus, FileReader)

# ╔═╡ 7f9fd244-f16b-47fe-8dd8-12e06152b733
sentences = parsesentences(c, latin23())

# ╔═╡ 3fa5b051-b4ba-48c7-a757-691bf7174073
typeof(sentences)

# ╔═╡ Cell order:
# ╟─d3d708ea-5a63-4c9e-9fc2-6801ada726e0
# ╠═a4471683-d5cd-4ca4-9f3b-c582427f473b
# ╟─2a2d0160-8794-11ed-23a7-0d6ff795640e
# ╟─99a2e366-4e46-401b-bae9-241e98425e97
# ╟─9b390dfb-1685-4cf8-bd37-2137f277a320
# ╟─d12ab940-f56a-49e0-bedf-b341f2124bc5
# ╠═059b137a-a5ff-4b9e-935b-b00effdf0a9f
# ╠═7f9fd244-f16b-47fe-8dd8-12e06152b733
# ╠═3fa5b051-b4ba-48c7-a757-691bf7174073
