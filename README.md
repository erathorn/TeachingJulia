# TeachingJulia

This Repository contains material for teaching the Julia Programming Language.

The material uses the [Pluto.jl](https://github.com/fonsp/Pluto.jl) infrastructure for the notebooks. To run the notebook install [Julia](https://julialang.org/downloads/) (I recommend at least Julia 1.7).

Run Julia and enter `]` to open Julias [package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).

```julia
]
(v1.7) pkg> add Pluto
```

This command will install Pluto for you.

Press `Ctrl+C` to return to the `julia>` prompt.

To run Pluto just use the following two commands. It will open up a browser window where you can open the Pluto notebook from this repository.

```julia
using Pluto

Pluto.run()
```
