### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

# ╔═╡ 2c373ba4-b441-11ed-1571-c38e22404d64
md"
# Useful Packages

There are several packages and use cases which are helpful for scientific computing and data science.

- [DataFrames](https://github.com/JuliaData/DataFrames.jl)

  - Data Manipulation (similar to Pandas)

- [Flux](https://github.com/FluxML/Flux.jl)/[Knet](https://github.com/denizyuret/Knet.jl)

  - Neural Networks (with GPU support)

- [Turing](https://turing.ml/)

  - Probabilitistic Progamming for Bayesian Inference

- [MLJ](https://github.com/alan-turing-institute/MLJ.jl)

  - General Purpose Machine Learning Tools (similar to scikit learn)

- [Plots](https://github.com/JuliaPlots/Plots.jl)

  - Plotting backend

- [Queryverse](https://www.queryverse.org/)

  - A collection of packages to do data manipulation (for data stored as DataFrames)

- [DifferentialEquations](https://github.com/SciML/DifferentialEquations.jl)

  - Support for Differential Equations and solvers (interacts well with Flux)

- [JuMP](https://github.com/jump-dev/JuMP.jl)/[Optim](https://github.com/JuliaNLSolvers/Optim.jl)

  - Optimization libraries

- [BioJulia](https://github.com/BioJulia)

  - A collection of packages for bioinformatics and biology related problems

- [JuliaImages](https://juliaimages.github.io/latest/)

  - A collection of packages for Image Analysis 

- [JuliaHealth](https://juliahealth.org/)

  - A collection of packages for computational health

- [DistributedArrays](https://github.com/JuliaParallel/DistributedArrays.jl)/[Dagger](https://github.com/JuliaParallel/Dagger.jl)

  - High level support for distributed computing and parallel processing

- [GPU](https://juliagpu.org/)

  - A collection of Packages for GPU computing (high and low level)

- [PyCall](https://github.com/JuliaPy/PyCall.jl)/[RCall](https://github.com/JuliaInterop/RCall.jl)

  - Call Python/R directly from Julia

- [Distributed](https://docs.julialang.org/en/v1/stdlib/Distributed/)

  - Package for Distributed Computing (adds pmap and similar operations)

- [LoopVectorization](https://github.com/JuliaSIMD/LoopVectorization.jl)

  - Easy control for threading and simd versions of loops

"

# ╔═╡ fa5be3d3-ca36-417d-958d-80df9035acc9
md"
# Example

This example shows a small neural network for the MINST task. It uses the SimpleChains.jl package for small and simple neural networks. For an evaluation of the performance and the computational tricks employed here, which make it so fast see this this [blog post](https://julialang.org/blog/2022/04/simple-chains/).

The example is taken from the SimpleChains.jl documentation [link](https://pumasai.github.io/SimpleChains.jl/stable/examples/mnist/).

First load the Dataset from a genreal dataset repo.
"

# ╔═╡ 25754023-f5ad-4e01-b917-ed1fa0c54394
begin
	xtrain3, ytrain0 = MLDatasets.MNIST(split=:train)[:];
	xtest3, ytest0 = MLDatasets.MNIST(split=:test)[:];
end;

# ╔═╡ d580cfc1-f63f-40a5-821c-17d24d123695
md"
The data needs be in the correct form and we need to account for the difference between 0 and 1 based indexing.
"

# ╔═╡ f221537d-b79d-4627-8bbb-cc4ab4e39e7c
begin
xtrain4 = reshape(xtrain3, 28, 28, 1, :);
xtest4 = reshape(xtest3, 28, 28, 1, :);
ytrain1 = UInt32.(ytrain0 .+ 1);
ytest1 = UInt32.(ytest0 .+ 1);
end;

# ╔═╡ cad0779b-bc7e-45f5-ab0c-5e4b52a844ef
md"
To solve the taks lets define the [LeNet5](https://ieeexplore.ieee.org/document/726791) architecture.
"

# ╔═╡ 7431d58f-2afa-44a7-9a54-992d0ae99616
lenet = SimpleChain(
  (static(28), static(28), static(1)),
  SimpleChains.Conv(SimpleChains.relu, (5, 5), 6),
  SimpleChains.MaxPool(2, 2),
  SimpleChains.Conv(SimpleChains.relu, (5, 5), 16),
  SimpleChains.MaxPool(2, 2),
  Flatten(3),
  TurboDense(SimpleChains.relu, 120),
  TurboDense(SimpleChains.relu, 84),
  TurboDense(identity, 10),
)

# ╔═╡ 906c7b9f-5068-4b51-b274-ab8df9fd4732
md"
Loss and initial parameters are added.
"

# ╔═╡ fa3bb03d-6912-492c-8376-26b2079fde12
begin
	lenetloss = SimpleChains.add_loss(lenet, LogitCrossEntropyLoss(ytrain1));
	p = SimpleChains.init_params(lenet);
end;

# ╔═╡ 649d6cec-704c-468c-8a54-2a7d965e01c6
md"
Some SimpleChains magic, which makes sure that the computation is well distributed.
"

# ╔═╡ d42fafdc-d83a-44b3-90b5-8fa672a0e693
begin
	estimated_num_cores = (Sys.CPU_THREADS ÷ ((Sys.ARCH === :x86_64) + 1));
	G = SimpleChains.alloc_threaded_grad(lenetloss);
end;

# ╔═╡ a8a980a5-e75e-4874-ae6b-660954e7fe17
SimpleChains.train_batched!(G, p, lenetloss, xtrain4, SimpleChains.ADAM(3e-4), 10);

# ╔═╡ 9ab76a6c-4b0a-4cb0-86c5-bb98f12e6129
SimpleChains.accuracy_and_loss(lenetloss, xtest4, ytest1, p)

# ╔═╡ d5c2b559-73ff-4ca5-b94b-a598615aee1b
SimpleChains.accuracy_and_loss(lenetloss, xtrain4, p)

# ╔═╡ 92a0e673-7c85-4698-9729-a6367e5898bd
ENV["DATADEPS_ALWAYS_ACCEPT"] = true

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═2c373ba4-b441-11ed-1571-c38e22404d64
# ╠═fa5be3d3-ca36-417d-958d-80df9035acc9
# ╠═25754023-f5ad-4e01-b917-ed1fa0c54394
# ╠═d580cfc1-f63f-40a5-821c-17d24d123695
# ╠═f221537d-b79d-4627-8bbb-cc4ab4e39e7c
# ╠═cad0779b-bc7e-45f5-ab0c-5e4b52a844ef
# ╠═7431d58f-2afa-44a7-9a54-992d0ae99616
# ╠═906c7b9f-5068-4b51-b274-ab8df9fd4732
# ╠═fa3bb03d-6912-492c-8376-26b2079fde12
# ╠═649d6cec-704c-468c-8a54-2a7d965e01c6
# ╠═d42fafdc-d83a-44b3-90b5-8fa672a0e693
# ╠═a8a980a5-e75e-4874-ae6b-660954e7fe17
# ╠═9ab76a6c-4b0a-4cb0-86c5-bb98f12e6129
# ╠═d5c2b559-73ff-4ca5-b94b-a598615aee1b
# ╠═92a0e673-7c85-4698-9729-a6367e5898bd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
