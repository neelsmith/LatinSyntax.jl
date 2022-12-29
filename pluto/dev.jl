### A Pluto.jl notebook ###
# v0.19.18

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

# ╔═╡ d12ab940-f56a-49e0-bedf-b341f2124bc5
f = joinpath(repo, "test", "data", "hyginus.cex")

# ╔═╡ 059b137a-a5ff-4b9e-935b-b00effdf0a9f
c = fromcex(f, CitableTextCorpus, FileReader)

# ╔═╡ 7f9fd244-f16b-47fe-8dd8-12e06152b733
parsesentences(c, latin23())

# ╔═╡ Cell order:
# ╟─d3d708ea-5a63-4c9e-9fc2-6801ada726e0
# ╟─a4471683-d5cd-4ca4-9f3b-c582427f473b
# ╟─2a2d0160-8794-11ed-23a7-0d6ff795640e
# ╟─d12ab940-f56a-49e0-bedf-b341f2124bc5
# ╠═059b137a-a5ff-4b9e-935b-b00effdf0a9f
# ╠═7f9fd244-f16b-47fe-8dd8-12e06152b733
