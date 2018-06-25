# Tips for Julia

To install: <https://julialang.org/downloads/>

##Help
To return the documentation of a function just use: `?`


##Packages
### Jupyter

Editor for

```Julia
using IJulia
notebook(detached=true)
```

more: <https://github.com/JuliaLang/IJulia.jl>


### Python

```Julia
using PyCall
@pyimport <package>
@pyimport numpy.random as nr
@pyimport matplotlib.pyplot as plt

@pyimport math
math.sin(math.pi / 4) - sin(pi / 4)  # returns 0.0
```
more: <https://github.com/JuliaPy/PyCall.jl>

### Pyplot

Package to plot

```Julia
using PyPlot
x = linspace(0,2*pi,1000); y = sin.(3 * x + 4 * cos.(2 * x));
plot(x, y, color="red", linewidth=2.0, linestyle="--")
title("A sinusoidally modulated sinusoid")
```

more: <https://github.com/JuliaPy/PyPlot.jl>

### Conda

Binary provider for Julia. It is linked to Anaconda but more channels can be added.

```Julia
using Conda
```
more: <https://github.com/JuliaPy/Conda.jl>
