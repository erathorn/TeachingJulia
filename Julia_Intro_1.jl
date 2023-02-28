### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

# ╔═╡ 02967c7a-73e5-11ed-3e70-f399ad79e5ba
using LinearAlgebra, AbstractTrees,  Images

# ╔═╡ ea03eee5-2743-45ec-96cf-cdac62a58ad4
md"
# Julia
"

# ╔═╡ 6a226338-9a38-42e1-8b3d-3f693f7253e4
load("Resources/TweetYannLeCun.png")

# ╔═╡ 09673cd2-07a4-4328-af9b-7ad8071332ad
md"

>We want a language that’s open source, with a liberal license. We want the speed of C with the dynamism of Ruby. We want a language that’s homoiconic, with true macros like Lisp, but with obvious, familiar mathematical notation like Matlab. We want something as usable for general programming as Python, as easy for statistics as R, as natural for string processing as Perl, as powerful for linear algebra as Matlab, as good at gluing programs together as the shell. Something that is dirt simple to learn, yet keeps the most serious hackers happy. We want it interactive and we want it compiled. (Did we mention it should be as fast as C?)

From [Why We Created Julia](https://julialang.org/blog/2012/02/why-we-created-julia/) by Jeff Bezanson Stefan Karpinski Viral B. Shah Alan Edelman.
"

# ╔═╡ 6c884326-e8da-4fe7-9207-6c38f6b39c32
md"
>Julia is a high-level, high-performance dynamic programming language for technical computing

Julia is...

- ... **Fast:** Native Code Generation for multiple plattforms via LLVM.
- ... **Dynamic:** Dynamically typed with good support for interactive scripting.
- ... **Reproducible:** Recreate the same Julia environment through prepacked binaries.
- ... **Composable:** Multiple Dispatch allows mixing and matching.
- ... **General:** Package Manager, Deebugger, Profiler asynchonous I/O are available.
- ... **Open Source:** Source Code is available on Github.
"

# ╔═╡ 8140335c-1d8a-44f2-9be0-055dea063f38
md"

## Ecosystem

### Visualization

A common Plotting Syntax accross Different Backends via Plot.jl

### General Purpose

Seamless integration with different Programming Languages. You can easily call C, Fortran, C++, Python, R or Matlab code. There are also packages in Python and R to call Julia. Julia Code can also be built into shared libraries and executables.

### Data Science

DataFrames.jl offers common data manipulation tools. Parsing CSV files is mutlithreaded using CSV.jl. And there exist packages to read almost all Databases. 

### Machine Learning

MLJ.jl offers an interface to common Machine Learning Algorithms (Regression, decision trees and others). FLUX.jl or KNET.jl offer DeepLearning functionalities and Turing.jl is a performant package for probabilisitc programming. 

### Scientific Domains

Scientific Machine Learning is well supported with packages for optimization, differential equations, iterative solvers, fast fourier transforms. There are also domainspecific ecosystems for: Biology, Image processing, Non-linear dynamics, ecology and others.

### Parallel Computing

Julia is desigend for parallelism! Julia has support for parallelism at several levels: Instruction Level, Multithreading, GPU.

"

# ╔═╡ d1feec77-ab81-414c-aa77-5d5da65d72a0
md"

## Running Julia

You can run Julia using...

1. ... the `REPL`.
2. ... a Jupyter notebook.
3. ... a Pluto notebook (like this one).
4. ... an IDE such as Visual Studio Code (VSCode)
5. ... writing a .jl file in a text editor and executing it.

If you have installed successfully installed Julia and typed `julia` into your terminal window (or opened it by clicking on the application in the file browswer) something like this should appear.
"

# ╔═╡ eddb5322-e9d8-4c7a-b919-51265e328b3e
load("Resources/REPL.png")

# ╔═╡ ac18b521-1136-431c-b000-b3d8023295f9
md"

The REPL is a powerfull tool to for fast and easy experimentation and execution of small code snippets.

There are four modes of the `REPL`:

1. **Julia Mode**: Enter Julia expressions and see their output
2. **Help Mode**: Type `?` and enter the help mode. The prompt should start with `help?>`. You can access help and documentation on the things you enter.
3. **Shell mode**: Type `;` and enter the shell mode. The prompt should start with `shell>`. You have a fully functioning shell.
5. **Package mode**: Type `]` and enter the package mode. The prompt should start with `(@v1.8)?>` (depending on your Julia version). You can add, update or remove (and other things) packages.

"

# ╔═╡ 4fd04231-74c9-4028-bc1e-daf33098f95c
md"
To load existing packages, use the `using` command.
"

# ╔═╡ 831c178a-781e-4530-a07f-31e2ec8e3fbe
md"
## Assignment and Basic Arithmetic

Assignment is done using the ```=``` sign and we can assign to any unicode symbol. We can get unicode symbols using latex completion (for most editors).

**All Julia operations return a value!**
"

# ╔═╡ d7d6039c-ea92-425c-8f9b-54a16c753ea7
my_variable = 1

# ╔═╡ 7255050c-c7f6-44e0-9012-42f9edee4557
α = "a greek letter"

# ╔═╡ d2dc2d5a-6379-4624-ad1b-369c4cd35f3c
😃 = 3

# ╔═╡ bb33998f-18c9-49b6-b7b6-230f225ae3b9
md"
Basic operators have their corresponding ```=``` version.

```julia
+=
*=
-=
/=
^=
```

## Types

Everything in Julia has a type. This is a core component of the language und one of the reasons for its performance. The ```typeof()``` function returns the type of somnething.
"

# ╔═╡ fe589816-a2c7-4dcd-bee1-1a4296c582b9
typeof(😃)

# ╔═╡ 5c335a81-d124-428a-be0d-8ac2177d1c90
typeof(α)

# ╔═╡ 173c4a87-59cc-44c9-afa5-634c0a5c8046
md"
All types in Julia a part of a fully connected type tree. Each value in Julia has a type from this tree.

Julia distinguishes between abstract and concrete/primitive types. 

> Abstract types cannot be instantiated, and serve only as nodes in the type graph, thereby describing sets of related concrete types: those concrete types which are their descendants.

> A primitive type is a concrete type whose data consists of plain old bits. Classic examples of primitive types are integers and floating-point values.
"

# ╔═╡ 946e2e10-37c3-43aa-aa87-848bf3a51059
print_tree(Integer)

# ╔═╡ 4e8a99ed-dd43-4dd5-836e-3dbb4fc1b185
md"
More on this in the second half.
"

# ╔═╡ ae7c8f08-75c9-4a7b-bd80-93c91eae353b
md"

## String interpolation

We can interpolate a Julia expression into a string using the ```$``` operator.
"

# ╔═╡ 4c93347a-a10e-4157-b07e-a865fe9c23e2
"The value of 😃 is $(😃)"

# ╔═╡ 0f23e67f-c8e1-4278-8057-e1bb0d57ce19
"The value of (3+2)^2 is $((3+2)^2)"

# ╔═╡ 524abdf3-2a46-4597-b320-5b7a6863599d
md"
## Basic collections

There are different types of collections in Julia. They can be divided into immutable and mutable collections.

### Immutable collections
#### Tuple
"

# ╔═╡ 118fc11f-a2b4-48e0-b703-2435d7ff08e4
t = (1,2)

# ╔═╡ d697980a-3710-4385-a0a1-ef3e080e1645
md"
Access the element by their index.

**NOTE: JULIA USES 1 BASED INDEXING**

The first element is accessed using index ```1```.
"

# ╔═╡ 6ed65e1a-f8cb-4f6d-8f12-3e656eddb5eb
t[1]

# ╔═╡ 98b61b35-d58b-4370-a571-47c9f2d9195e
md"
#### Named Tuple
"

# ╔═╡ 7f24a0d5-ef6b-47c1-8295-935933cc3c03
n = (first=1, second=2)

# ╔═╡ 090378d0-63ee-4db6-ae75-0d00f61c8870
md"
Access elements either by their index or by their name.
"

# ╔═╡ a01bd643-8ab4-4a6d-ad0d-3ade2d191269
n.first

# ╔═╡ 12849e5e-c3d2-4aad-82c6-72edb13dfed4
n[2]

# ╔═╡ bb757b08-200e-45be-a39c-f96c24396c8b
md"
## Mutabalbe collections
#### Dictionary
"

# ╔═╡ afe0d25e-933f-4eab-9448-5822e5349133
phone_book = Dict("Batman" => "na na na", "Spiderman" => "32 16 8")

# ╔═╡ fbeb9076-2540-480f-aafd-b659f03605de
md"
Access elements only by their key using ```[]```.
"

# ╔═╡ 77704a52-e9a9-4434-83c7-d798abb1bdde
phone_book["Batman"]

# ╔═╡ b8b45c09-fa3b-4a77-a429-cab42e800776
md"
We add values using ```[]``` and the assignment operator.
"

# ╔═╡ 7216a6f8-28ae-4e9c-8273-ad86495ea465
phone_book["Turk"] = "916-CALL-TURK";

# ╔═╡ 2841edc2-e177-494c-a1ba-f4a20b59b71d
phone_book

# ╔═╡ 7560baf8-1bfe-46ff-8b2f-9945b0bd50c0
md"
#### Arrays

The standard Julia array is a mutable and orderd collection of the same type and with a given dimensionality. An Array with dimensionality ```1``` is a ```Vector```. And an Array with dimensionality ```2``` is a ```Matrix```. The element types and the dimensionality of an Array are indepenent of one another.

A Matrix and a Vector of Vectors are two different things!!! *(Other than in Python)*
"

# ╔═╡ 25ca28e2-690a-4639-9a44-9b91888a354f
first_array = [1, 2, 3, 4]

# ╔═╡ 87956312-9300-4f45-8485-90b6cee73fc4
string_array = ["element 1", "element 2"]

# ╔═╡ a0a4d1bc-0efc-4b20-a32d-e944212438c3
mixed_array = ["Johannes", 1.0, 😃]

# ╔═╡ a9f8bb58-04b0-4c08-8f32-9e22b40ed22d
typeof(first_array)

# ╔═╡ 2d57f9d6-bc8f-498c-8eea-c95f4199f282
typeof(mixed_array)

# ╔═╡ 1c0d0bf4-054f-48f7-a45a-3e1beb40455f
ex_matrix = [1 2 3;
4 5 6;
7 8 9]

# ╔═╡ d46c1d5a-fdf6-40da-ae10-7be67d8c65de
vec_of_vec = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# ╔═╡ d3904977-240c-401b-9fc5-6055d86d150d
typeof(vec_of_vec)

# ╔═╡ cfb97c37-4b71-4a85-8d61-ab9e3b64463c
neseted_vec = [[1,2], [3,4,5], [6,7,8]]

# ╔═╡ 2764ab0e-9fde-4cee-81c3-28155a502280
md"
There are also functions which initialize matrices.
"

# ╔═╡ 30707864-6cae-460b-a6b8-1140e14ec746
rand_mat = rand(4,4)

# ╔═╡ 236a77f5-5d52-48f9-a926-35b4521f849c
md"
Other functions are ```zeros()``` or ```ones()```.

Arrays can be indexed using mutlidimensional indexing schemes. (Indexing is very similar to numpy)

A specific element:
"

# ╔═╡ 9cae51d0-3a31-4d63-a17d-903eddb9e549
rand_mat[1, 2]

# ╔═╡ ba17ba4b-635a-44cb-b4e4-58874300135c
md"
Since Arrays are mutable we can change the elements.
"

# ╔═╡ fd2bd59c-5090-41e8-a30b-2f9ebec303f3
rand_mat[1, 2] = 10

# ╔═╡ 53b484b4-834c-448f-a562-88902cb38107
rand_mat

# ╔═╡ 0e613339-fd42-4484-b508-6c9ab482f7e8
md"
Indexing and assignment can also be done for larger parts of the array.


A column:
"

# ╔═╡ e4120f9e-cee0-4b6a-9c1b-79464473159b
rand_mat[:, 3]

# ╔═╡ 8b863fc7-17d2-4b37-92dc-296dafdb1a39
md"
A row
"

# ╔═╡ 9b15f12a-2a1d-4d16-8dd7-8ee73c624d02
rand_mat[2, :]

# ╔═╡ 6e02fec2-e425-4825-ae5f-b75d895cd6a6
md"
A part of the matrix
"

# ╔═╡ c0ed499f-2746-4d3e-974f-f5ca8409a150
rand_mat[1:3, 3:4]

# ╔═╡ b161dfc3-4b9c-43b0-83b1-fe06f452615f
md"

Matrices and Vectors of Vectors are two different things. When doing matrix multiplication using Vectors of Vectors will not work.
"

# ╔═╡ 540eacdb-1c76-4516-86cc-6edfe1d8b9f8
rand_mat * rand(4,4)

# ╔═╡ 86801325-9b7d-4b11-bbf5-8517587967a9
vec_of_vec * rand(3,3)

# ╔═╡ 2526e3d9-0230-4b91-b5bb-5d6d027c5f63
md"
### Ranges

Ranges are a shorthand for a vector.
"

# ╔═╡ 6ae6abe7-9361-4973-a686-9cd511e5cd96
range1 = 1:5

# ╔═╡ 6af6640d-2a18-445a-bf13-30f366b65ddb
collect(range1)

# ╔═╡ b769ae49-e982-4763-8243-1fc172cb7520
range1_steps = 1:3:10

# ╔═╡ 6698713f-14a1-48b3-80d7-18a0968aa6cb
collect(range1_steps)

# ╔═╡ bfb84eb0-bf71-4dcc-aaa7-aa383fc84520
range2 = 'a':'e'

# ╔═╡ be0c38da-d1c1-4d43-8a56-e204414036ba
collect(range2)

# ╔═╡ c59e7489-80cc-4551-8edf-eefb8eca0f0d
md"
## Iterations

### For Loop

Julia offers high-level iteration functionalities. The basic syntax is:

```julia
for *var* in *loop iterable*
	*loop body*
end
```
"

# ╔═╡ fe3b6aa2-0711-433e-b903-65b1fb03167a
for i in 1:5
	println(i)
end

# ╔═╡ 0756a0e1-1991-44be-8d2d-c5f23ed55af8
for (key, value) ∈ phone_book
	println("phone number of $(key) is $(value)")
end

# ╔═╡ 25b4ed13-796d-46dc-b3c4-86a60101575a
md"
### While loop
"

# ╔═╡ e32575fc-ece6-4225-80ce-b3a4d4815a2c
begin
	i = 0
	while i < 5
		println(i)
		i+=1
	end
end

# ╔═╡ ba3e566a-d043-48e5-a170-0f7af0b6cb31
md"
## Conditionals
"

# ╔═╡ 2a1c01d4-6833-4cf0-8bc6-c959fab28b12
begin
	a, b = 3, 4
	if a < b
		println("a is less than b ($a < $b)")
	else
		println("b is less than a ($b < $a)")
	end
end


# ╔═╡ 468f7d50-b944-48b0-add1-3b18411d0171
🪝 = a + 😃

# ╔═╡ f2d7758c-d9fc-4c6e-b14c-b52db3602d98
begin
	c = 5
	if a < b && b < c
		println("a = $a is the smalles number.")
	elseif b < a && a < c
		println("b = $b is the smalles number.")
	elseif c < b && b < a
		println("c = $c is the smalles number.")
	else
		println("Sorry, I cannot decide.")
	end
end

# ╔═╡ 3aa9ae04-275c-4d95-bb8e-2f70eb76f795
md"
## Functions

Functions map arguments to a return value.
"

# ╔═╡ 270305b0-5315-4968-861c-255b2250f786
function my_addition(x, y)
	return x + y # you can also omit the "return" keyword
end

# ╔═╡ 94c315c0-bd8b-4796-99a1-2af97aee548d
md"
For short functions, there also exists a more compact form.
"

# ╔═╡ e007fc14-cd80-4a59-94d3-e97f0d5ce6b1
compact_add(x, y) = x +y

# ╔═╡ 11e0f424-02d2-4052-bee8-3e6e31dacce4
md"
Functions can be called by using their name and the respective number of arguments.
"

# ╔═╡ cd8f55db-a3ee-45ac-bfe1-2634e31765b1
my_addition(4,5)

# ╔═╡ 20dd06d4-d36c-48ef-b133-941f861cb603
compact_add(4,5)

# ╔═╡ 2e3f5ef7-980a-4d7f-b1af-52dbc0b46a31
md"
Functions can be passed around like any other object.
"

# ╔═╡ 7b15a2db-3213-40c5-82df-96d317b3f257
begin
	new_add = compact_add
	new_add(3,7)
end

# ╔═╡ 268d719d-911e-4cfa-9d74-cc75b30aac92
md"
We can combine functions by composition.
"

# ╔═╡ 107a656e-be6f-43a8-a8a9-6b0d9e8c6ff2
begin
	f(x) = log(x)
	g(x) = sqrt(x)
end

# ╔═╡ 69d9d1fd-3cb0-4c33-986f-8b626c8dfd93
f(g(5))

# ╔═╡ 21c50df0-ff26-4d06-819e-3d694a5ca4f7
md"
An alternative syntax is using the ∘ operator which also does function composition.
"

# ╔═╡ 3ff29b8d-970f-4ebf-b0da-bcdb615b2a10
(f ∘ g)(5)

# ╔═╡ f6e061bb-77d1-4691-a320-65c1a7c62d9f
md"
In fact most operators (+, - etc.) are functions, wich can also be used using the function syntax.
"

# ╔═╡ e1646097-6435-4bd2-b765-17495649a525
*(4, 2, 0.4)

# ╔═╡ d932bfe5-e925-40ab-9e2f-647784ba1780
md"
If you want to pass keyword arguments to a function, add them after a `;` and assign default values using the `=` sign.
"

# ╔═╡ ed334667-c8d5-4f84-b579-97971affa25a
function my_weired_function(;fa=1, fb=2)
	return fa + fb
end

# ╔═╡ aa5c3995-e0b1-4241-a6a1-76fd0659a715
my_weired_function()

# ╔═╡ f5af072d-dbe0-4d6c-bbc2-63cc18f16956
my_weired_function(fa=3)

# ╔═╡ 15adead7-df61-456a-a981-779930557d10
md"
## Exercises
"

# ╔═╡ 80216946-d1a7-4672-9dd0-fcaf28b69072
md"
### Exercise 1
Based on the output of the following loop:
"

# ╔═╡ 09b869ed-870a-400c-9c39-a01755eebf9e
begin
	A = [1 2; 3 4]
	# visit each index of A efficiently
	for i in eachindex(A)
	    println("i = $i, A[i] = $(A[i])")
	end
	
end

# ╔═╡ b67d5316-f3d3-4047-9b97-fbd8a20eda96
md"can you tell whether Julia is row or column-major ordered? (i.e., whether arrays are stacked one row or one column at a time in memory)"

# ╔═╡ 406d3d4c-f210-48e0-9975-f918d98640cb
md"
### Exercise 2

Write a program that prints the integers from 1 to 100 (inclusive), except that:

- for multiples of three, print “Fizz” instead of the number
- for multiples of five, print “Buzz” instead of the number
- for multiples of both three and five, print “FizzBuzz” instead of the number
"

# ╔═╡ a12b0cd3-71f1-4dc7-84d4-86788a0e6464
md"
### Exercise 3


A palindrome is a word that is spelled the same backward and forward, like “noon” and “redivider”. Recursively, a word is a palindrome if the first and last letters are the same and the middle is a palindrome.

The following are functions that take a string argument and return the first, last, and middle letters:
"

# ╔═╡ 7b4074c7-c159-47a9-a9f7-2cca66f16cdb
function first(word)
    first = firstindex(word)
    word[first]
end

# ╔═╡ 9483bbf5-69b7-41d9-9606-22f0c8bdf4b2
function last(word)
    last = lastindex(word)
    word[last]
end

# ╔═╡ e2ab8d0b-b8f0-4c45-807f-f38cd96b89f8
function middle(word)
    first = firstindex(word)
    last = lastindex(word)
    word[nextind(word, first) : prevind(word, last)]
end

# ╔═╡ 56bfce44-9912-4f69-96e4-500d81fe14bc
md"Write a function called `ispalindrome` that takes a string argument and returns `true` if it is a palindrome and `false` otherwise. Remember that you can use the built-in function length to check the length of a string."

# ╔═╡ aa129e6f-b7b1-4408-a82f-32be1df1ae3c
md"
# Bookkeeping
"

# ╔═╡ 1acfda65-be06-4be2-ade8-bd376359c240
AbstractTrees.children(d::DataType) = subtypes(d)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
AbstractTrees = "1520ce14-60c1-5f80-bbc7-55ef81b5835c"
Images = "916415d5-f1e6-5110-898d-aaa5f9f070e0"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[compat]
AbstractTrees = "~0.4.3"
Images = "~0.25.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "afa7729f2747610f6e6efe53df444f623a32a6ba"

[[deps.AbstractFFTs]]
deps = ["ChainRulesCore", "LinearAlgebra"]
git-tree-sha1 = "69f7020bd72f069c219b5e8c236c1fa90d2cb409"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.2.1"

[[deps.AbstractTrees]]
git-tree-sha1 = "52b3b436f8f73133d7bc3a6c71ee7ed6ab2ab754"
uuid = "1520ce14-60c1-5f80-bbc7-55ef81b5835c"
version = "0.4.3"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "195c5505521008abea5aee4f96930717958eac6f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.4.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.ArnoldiMethod]]
deps = ["LinearAlgebra", "Random", "StaticArrays"]
git-tree-sha1 = "62e51b39331de8911e4a7ff6f5aaf38a5f4cc0ae"
uuid = "ec485272-7323-5ecc-a04f-4719b315124d"
version = "0.2.0"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "66771c8d21c8ff5e3a93379480a2307ac36863f7"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.1"

[[deps.AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "1dd4d9f5beebac0c03446918741b1a03dc5e5788"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.6"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CEnum]]
git-tree-sha1 = "eb4cb44a499229b3b8426dcfb5dd85333951ff90"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.4.2"

[[deps.CatIndices]]
deps = ["CustomUnitRanges", "OffsetArrays"]
git-tree-sha1 = "a0f80a09780eed9b1d106a1bf62041c2efc995bc"
uuid = "aafaddc9-749c-510e-ac4f-586e18779b91"
version = "0.2.2"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "e7ff6cadf743c098e08fca25c91103ee4303c9bb"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.6"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "38f7a08f19d8810338d4f5085211c7dfa5d5bdd8"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.4"

[[deps.Clustering]]
deps = ["Distances", "LinearAlgebra", "NearestNeighbors", "Printf", "Random", "SparseArrays", "Statistics", "StatsBase"]
git-tree-sha1 = "64df3da1d2a26f4de23871cd1b6482bb68092bd5"
uuid = "aaaa29a8-35af-508c-8bc3-b662a17a0fe5"
version = "0.14.3"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "d08c20eef1f2cbc6e60fd3612ac4340b89fea322"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.9"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "fc08e5930ee9a4e03f84bfb5211cb54e7769758a"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.10"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "00a2cccc7f098ff3b66806862d275ca3db9e6e5a"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.5.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.ComputationalResources]]
git-tree-sha1 = "52cb3ec90e8a8bea0e62e275ba577ad0f74821f7"
uuid = "ed09eef8-17a6-5b46-8889-db040fac31e3"
version = "0.3.2"

[[deps.CoordinateTransformations]]
deps = ["LinearAlgebra", "StaticArrays"]
git-tree-sha1 = "681ea870b918e7cff7111da58791d7f718067a19"
uuid = "150eb455-5306-5404-9cee-2592286d6298"
version = "0.6.2"

[[deps.CustomUnitRanges]]
git-tree-sha1 = "1a3f97f907e6dd8983b744d2642651bb162a3f7a"
uuid = "dc8bdbbb-1ca9-579f-8c36-e416f6a65cce"
version = "1.0.2"

[[deps.DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Distances]]
deps = ["LinearAlgebra", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "3258d0659f812acde79e8a74b11f17ac06d0ca04"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.7"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FFTViews]]
deps = ["CustomUnitRanges", "FFTW"]
git-tree-sha1 = "cbdf14d1e8c7c8aacbe8b19862e0179fd08321c2"
uuid = "4f61f5a4-77b1-5117-aa51-3ab5ef4ef0cd"
version = "0.3.2"

[[deps.FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "LinearAlgebra", "MKL_jll", "Preferences", "Reexport"]
git-tree-sha1 = "90630efff0894f8142308e334473eba54c433549"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.5.0"

[[deps.FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c6033cc3892d0ef5bb9cd29b7f2f0331ea5184ea"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.10+0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "7be5f99f7d15578798f338f5433b6c432ea8037b"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.16.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Ghostscript_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "43ba3d3c82c18d88471cfd2924931658838c9d8f"
uuid = "61579ee1-b43e-5ca0-a5da-69d92c66a64b"
version = "9.55.0+4"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "d61890399bc535850c4bf08e4e0d3a7ad0f21cbd"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.2"

[[deps.Graphs]]
deps = ["ArnoldiMethod", "Compat", "DataStructures", "Distributed", "Inflate", "LinearAlgebra", "Random", "SharedArrays", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "1cf1d7dcb4bc32d7b4a5add4232db3750c27ecb4"
uuid = "86223c79-3864-5bf0-83f7-82e725a168b6"
version = "1.8.0"

[[deps.ImageAxes]]
deps = ["AxisArrays", "ImageBase", "ImageCore", "Reexport", "SimpleTraits"]
git-tree-sha1 = "c54b581a83008dc7f292e205f4c409ab5caa0f04"
uuid = "2803e5a7-5153-5ecf-9a86-9b4c37f5f5ac"
version = "0.6.10"

[[deps.ImageBase]]
deps = ["ImageCore", "Reexport"]
git-tree-sha1 = "b51bb8cae22c66d0f6357e3bcb6363145ef20835"
uuid = "c817782e-172a-44cc-b673-b171935fbb9e"
version = "0.1.5"

[[deps.ImageContrastAdjustment]]
deps = ["ImageCore", "ImageTransformations", "Parameters"]
git-tree-sha1 = "0d75cafa80cf22026cea21a8e6cf965295003edc"
uuid = "f332f351-ec65-5f6a-b3d1-319c6670881a"
version = "0.3.10"

[[deps.ImageCore]]
deps = ["AbstractFFTs", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Graphics", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "Reexport"]
git-tree-sha1 = "acf614720ef026d38400b3817614c45882d75500"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.9.4"

[[deps.ImageDistances]]
deps = ["Distances", "ImageCore", "ImageMorphology", "LinearAlgebra", "Statistics"]
git-tree-sha1 = "b1798a4a6b9aafb530f8f0c4a7b2eb5501e2f2a3"
uuid = "51556ac3-7006-55f5-8cb3-34580c88182d"
version = "0.2.16"

[[deps.ImageFiltering]]
deps = ["CatIndices", "ComputationalResources", "DataStructures", "FFTViews", "FFTW", "ImageBase", "ImageCore", "LinearAlgebra", "OffsetArrays", "Reexport", "SnoopPrecompile", "SparseArrays", "StaticArrays", "Statistics", "TiledIteration"]
git-tree-sha1 = "f265e53558fbbf23e0d54e4fab7106c0f2a9e576"
uuid = "6a3955dd-da59-5b1f-98d4-e7296123deb5"
version = "0.7.3"

[[deps.ImageIO]]
deps = ["FileIO", "IndirectArrays", "JpegTurbo", "LazyModules", "Netpbm", "OpenEXR", "PNGFiles", "QOI", "Sixel", "TiffImages", "UUIDs"]
git-tree-sha1 = "342f789fd041a55166764c351da1710db97ce0e0"
uuid = "82e4d734-157c-48bb-816b-45c225c6df19"
version = "0.6.6"

[[deps.ImageMagick]]
deps = ["FileIO", "ImageCore", "ImageMagick_jll", "InteractiveUtils", "Libdl", "Pkg", "Random"]
git-tree-sha1 = "5bc1cb62e0c5f1005868358db0692c994c3a13c6"
uuid = "6218d12a-5da1-5696-b52f-db25d2ecc6d1"
version = "1.2.1"

[[deps.ImageMagick_jll]]
deps = ["Artifacts", "Ghostscript_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pkg", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "124626988534986113cfd876e3093e4a03890f58"
uuid = "c73af94c-d91f-53ed-93a7-00f77d67a9d7"
version = "6.9.12+3"

[[deps.ImageMetadata]]
deps = ["AxisArrays", "ImageAxes", "ImageBase", "ImageCore"]
git-tree-sha1 = "36cbaebed194b292590cba2593da27b34763804a"
uuid = "bc367c6b-8a6b-528e-b4bd-a4b897500b49"
version = "0.9.8"

[[deps.ImageMorphology]]
deps = ["ImageCore", "LinearAlgebra", "Requires", "TiledIteration"]
git-tree-sha1 = "e7c68ab3df4a75511ba33fc5d8d9098007b579a8"
uuid = "787d08f9-d448-5407-9aad-5290dd7ab264"
version = "0.3.2"

[[deps.ImageQualityIndexes]]
deps = ["ImageContrastAdjustment", "ImageCore", "ImageDistances", "ImageFiltering", "LazyModules", "OffsetArrays", "SnoopPrecompile", "Statistics"]
git-tree-sha1 = "5985d467623f106523ed8351f255642b5141e7be"
uuid = "2996bd0c-7a13-11e9-2da2-2f5ce47296a9"
version = "0.3.4"

[[deps.ImageSegmentation]]
deps = ["Clustering", "DataStructures", "Distances", "Graphs", "ImageCore", "ImageFiltering", "ImageMorphology", "LinearAlgebra", "MetaGraphs", "RegionTrees", "SimpleWeightedGraphs", "StaticArrays", "Statistics"]
git-tree-sha1 = "fb0b597b4928e29fed0597724cfbb5940974f8ca"
uuid = "80713f31-8817-5129-9cf8-209ff8fb23e1"
version = "1.8.0"

[[deps.ImageShow]]
deps = ["Base64", "FileIO", "ImageBase", "ImageCore", "OffsetArrays", "StackViews"]
git-tree-sha1 = "b563cf9ae75a635592fc73d3eb78b86220e55bd8"
uuid = "4e3cecfd-b093-5904-9786-8bbb286a6a31"
version = "0.3.6"

[[deps.ImageTransformations]]
deps = ["AxisAlgorithms", "ColorVectorSpace", "CoordinateTransformations", "ImageBase", "ImageCore", "Interpolations", "OffsetArrays", "Rotations", "StaticArrays"]
git-tree-sha1 = "8717482f4a2108c9358e5c3ca903d3a6113badc9"
uuid = "02fcd773-0e25-5acc-982a-7f6622650795"
version = "0.9.5"

[[deps.Images]]
deps = ["Base64", "FileIO", "Graphics", "ImageAxes", "ImageBase", "ImageContrastAdjustment", "ImageCore", "ImageDistances", "ImageFiltering", "ImageIO", "ImageMagick", "ImageMetadata", "ImageMorphology", "ImageQualityIndexes", "ImageSegmentation", "ImageShow", "ImageTransformations", "IndirectArrays", "IntegralArrays", "Random", "Reexport", "SparseArrays", "StaticArrays", "Statistics", "StatsBase", "TiledIteration"]
git-tree-sha1 = "03d1301b7ec885b266c0f816f338368c6c0b81bd"
uuid = "916415d5-f1e6-5110-898d-aaa5f9f070e0"
version = "0.25.2"

[[deps.Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "87f7662e03a649cffa2e05bf19c303e168732d3e"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.1.2+0"

[[deps.IndirectArrays]]
git-tree-sha1 = "012e604e1c7458645cb8b436f8fba789a51b257f"
uuid = "9b13fd28-a010-5f03-acff-a1bbcff69959"
version = "1.0.0"

[[deps.Inflate]]
git-tree-sha1 = "5cd07aab533df5170988219191dfad0519391428"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.3"

[[deps.IntegralArrays]]
deps = ["ColorTypes", "FixedPointNumbers", "IntervalSets"]
git-tree-sha1 = "be8e690c3973443bec584db3346ddc904d4884eb"
uuid = "1d092043-8f09-5a30-832f-7509e371ab51"
version = "0.1.5"

[[deps.IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d979e54b71da82f3a65b62553da4fc3d18c9004c"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2018.0.3+2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.Interpolations]]
deps = ["Adapt", "AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "721ec2cf720536ad005cb38f50dbba7b02419a15"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.14.7"

[[deps.IntervalSets]]
deps = ["Dates", "Random", "Statistics"]
git-tree-sha1 = "16c0cc91853084cb5f58a78bd209513900206ce6"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.7.4"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "49510dfcb407e572524ba94aeae2fced1f3feb0f"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.8"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.JLD2]]
deps = ["FileIO", "MacroTools", "Mmap", "OrderedCollections", "Pkg", "Printf", "Reexport", "TranscodingStreams", "UUIDs"]
git-tree-sha1 = "ec8a9c9f0ecb1c687e34c1fda2699de4d054672a"
uuid = "033835bb-8acc-5ee8-8aae-3f567f8a3819"
version = "0.4.29"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JpegTurbo]]
deps = ["CEnum", "FileIO", "ImageCore", "JpegTurbo_jll", "TOML"]
git-tree-sha1 = "106b6aa272f294ba47e96bd3acbabdc0407b5c60"
uuid = "b835a17e-a41a-41e7-81f0-2f016b05efe0"
version = "0.1.2"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b53380851c6e6664204efb2e62cd24fa5c47e4ba"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.2+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"

[[deps.LazyModules]]
git-tree-sha1 = "a560dd966b386ac9ae60bdd3a3d3a326062d3c3e"
uuid = "8cdb02fc-e678-4876-92c5-9defec4f444e"
version = "0.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "3eb79b0ca5764d4799c06699573fd8f533259713"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.4.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "946607f84feb96220f480e0422d3484c49c00239"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.19"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "Pkg"]
git-tree-sha1 = "2ce8695e1e699b68702c03402672a69f54b8aca9"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2022.2.0+0"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

[[deps.MappedArrays]]
git-tree-sha1 = "e8b359ef06ec72e8c030463fe02efe5527ee5142"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.1"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.MetaGraphs]]
deps = ["Graphs", "JLD2", "Random"]
git-tree-sha1 = "1130dbe1d5276cb656f6e1094ce97466ed700e5a"
uuid = "626554b9-1ddb-594c-aa3c-2596fe9399a5"
version = "0.7.2"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "7b86a5d4d70a9f5cdf2dacb3cbe6d251d1a61dbe"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.4"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "a7c3d1da1189a1c2fe843a3bfa04d18d20eb3211"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.1"

[[deps.NearestNeighbors]]
deps = ["Distances", "StaticArrays"]
git-tree-sha1 = "2c3726ceb3388917602169bed973dbc97f1b51a8"
uuid = "b8a86587-4115-5ab1-83bc-aa920d37bbce"
version = "0.4.13"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore", "ImageMetadata"]
git-tree-sha1 = "5ae7ca23e13855b3aba94550f26146c01d259267"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.1.0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "f71d8950b724e9ff6110fc948dff5a329f901d64"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.12.8"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "327f53360fdb54df7ecd01e96ef1983536d1e633"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.2"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "923319661e9a22712f24596ce81c54fc0366f304"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.1.1+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "f809158b27eba0c18c269cf2a2be6ed751d3e81d"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.3.17"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "03a7a85b76381a3d04c7a1656039197e70eda03d"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.11"

[[deps.Parameters]]
deps = ["OrderedCollections", "UnPack"]
git-tree-sha1 = "34c0e9ad262e5f7fc75b10a9952ca7692cfc5fbe"
uuid = "d96e819e-fc66-5662-9728-84c9c7592b0a"
version = "0.12.3"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PkgVersion]]
deps = ["Pkg"]
git-tree-sha1 = "f6cf8e7944e50901594838951729a1861e668cb8"
uuid = "eebad327-c553-4316-9ea0-9fa01ccd7688"
version = "0.3.2"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "d7a7aef8f8f2d537104f170139553b14dfe39fe9"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.2"

[[deps.QOI]]
deps = ["ColorTypes", "FileIO", "FixedPointNumbers"]
git-tree-sha1 = "18e8f4d1426e965c7b532ddd260599e1510d26ce"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.0"

[[deps.Quaternions]]
deps = ["LinearAlgebra", "Random", "RealDot"]
git-tree-sha1 = "da095158bdc8eaccb7890f9884048555ab771019"
uuid = "94ee1d12-ae83-5a48-8b1c-48b8ff168ae0"
version = "0.7.4"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RangeArrays]]
git-tree-sha1 = "b9039e93773ddcfc828f12aadf7115b4b4d225f5"
uuid = "b3c3ace0-ae52-54e7-9d0b-2c1406fd6b9d"
version = "0.3.2"

[[deps.Ratios]]
deps = ["Requires"]
git-tree-sha1 = "dc84268fe0e3335a62e315a3a7cf2afa7178a734"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.3"

[[deps.RealDot]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "9f0a1b71baaf7650f4fa8a1d168c7fb6ee41f0c9"
uuid = "c1ae055f-0cd5-4b69-90a6-9a35b1a98df9"
version = "0.1.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RegionTrees]]
deps = ["IterTools", "LinearAlgebra", "StaticArrays"]
git-tree-sha1 = "4618ed0da7a251c7f92e869ae1a19c74a7d2a7f9"
uuid = "dee08c22-ab7f-5625-9660-a9af2021b33f"
version = "0.3.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Rotations]]
deps = ["LinearAlgebra", "Quaternions", "Random", "StaticArrays", "Statistics"]
git-tree-sha1 = "9480500060044fd25a1c341da53f34df7443c2f2"
uuid = "6038ab10-8711-5258-84ad-4b1120ba62dc"
version = "1.3.4"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[deps.SimpleWeightedGraphs]]
deps = ["Graphs", "LinearAlgebra", "Markdown", "SparseArrays", "Test"]
git-tree-sha1 = "7d0b07df35fccf9b866a94bcab98822a87a3cb6f"
uuid = "47aef6b3-ad0c-573a-a1e2-d07658019622"
version = "1.3.0"

[[deps.Sixel]]
deps = ["Dates", "FileIO", "ImageCore", "IndirectArrays", "OffsetArrays", "REPL", "libsixel_jll"]
git-tree-sha1 = "8fb59825be681d451c246a795117f317ecbcaa28"
uuid = "45858cf5-a6b0-47a3-bbea-62219f50df47"
version = "0.1.2"

[[deps.SnoopPrecompile]]
git-tree-sha1 = "f604441450a3c0569830946e5b33b78c928e1a85"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.1"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "d75bda01f8c31ebb72df80a46c88b25d1c79c56d"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.7"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "ffc098086f35909741f71ce21d03dadf0d2bfa76"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.11"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6b7ba252635a5eff6a0b0664a41ee140a1c9e72a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f9af7f195fb13589dd2e2d57fdb401717d2eb1f6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.5.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TiffImages]]
deps = ["ColorTypes", "DataStructures", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "Mmap", "OffsetArrays", "PkgVersion", "ProgressMeter", "UUIDs"]
git-tree-sha1 = "7e6b0e3e571be0b4dd4d2a9a3a83b65c04351ccc"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.6.3"

[[deps.TiledIteration]]
deps = ["OffsetArrays"]
git-tree-sha1 = "5683455224ba92ef59db72d10690690f4a8dc297"
uuid = "06e1c1a7-607b-532d-9fad-de7d9aa2abac"
version = "0.3.1"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "e4bdc63f5c6d62e80eb1c0043fcc0360d5950ff7"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.10"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.UnPack]]
git-tree-sha1 = "387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b"
uuid = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"
version = "1.0.2"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "de67fa59e33ad156a590055375a30b23c40299d3"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e45044cd873ded54b6a5bac0eb5c971392cf1927"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.2+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "libpng_jll"]
git-tree-sha1 = "d4f63314c8aa1e48cd22aa0c17ed76cd1ae48c3c"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.10.3+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─ea03eee5-2743-45ec-96cf-cdac62a58ad4
# ╟─6a226338-9a38-42e1-8b3d-3f693f7253e4
# ╟─09673cd2-07a4-4328-af9b-7ad8071332ad
# ╟─6c884326-e8da-4fe7-9207-6c38f6b39c32
# ╟─8140335c-1d8a-44f2-9be0-055dea063f38
# ╟─d1feec77-ab81-414c-aa77-5d5da65d72a0
# ╟─eddb5322-e9d8-4c7a-b919-51265e328b3e
# ╟─ac18b521-1136-431c-b000-b3d8023295f9
# ╟─4fd04231-74c9-4028-bc1e-daf33098f95c
# ╠═02967c7a-73e5-11ed-3e70-f399ad79e5ba
# ╟─831c178a-781e-4530-a07f-31e2ec8e3fbe
# ╠═d7d6039c-ea92-425c-8f9b-54a16c753ea7
# ╠═7255050c-c7f6-44e0-9012-42f9edee4557
# ╠═d2dc2d5a-6379-4624-ad1b-369c4cd35f3c
# ╠═468f7d50-b944-48b0-add1-3b18411d0171
# ╟─bb33998f-18c9-49b6-b7b6-230f225ae3b9
# ╠═fe589816-a2c7-4dcd-bee1-1a4296c582b9
# ╠═5c335a81-d124-428a-be0d-8ac2177d1c90
# ╟─173c4a87-59cc-44c9-afa5-634c0a5c8046
# ╠═946e2e10-37c3-43aa-aa87-848bf3a51059
# ╟─4e8a99ed-dd43-4dd5-836e-3dbb4fc1b185
# ╟─ae7c8f08-75c9-4a7b-bd80-93c91eae353b
# ╠═4c93347a-a10e-4157-b07e-a865fe9c23e2
# ╠═0f23e67f-c8e1-4278-8057-e1bb0d57ce19
# ╟─524abdf3-2a46-4597-b320-5b7a6863599d
# ╠═118fc11f-a2b4-48e0-b703-2435d7ff08e4
# ╟─d697980a-3710-4385-a0a1-ef3e080e1645
# ╠═6ed65e1a-f8cb-4f6d-8f12-3e656eddb5eb
# ╟─98b61b35-d58b-4370-a571-47c9f2d9195e
# ╠═7f24a0d5-ef6b-47c1-8295-935933cc3c03
# ╟─090378d0-63ee-4db6-ae75-0d00f61c8870
# ╠═a01bd643-8ab4-4a6d-ad0d-3ade2d191269
# ╠═12849e5e-c3d2-4aad-82c6-72edb13dfed4
# ╟─bb757b08-200e-45be-a39c-f96c24396c8b
# ╠═afe0d25e-933f-4eab-9448-5822e5349133
# ╟─fbeb9076-2540-480f-aafd-b659f03605de
# ╠═77704a52-e9a9-4434-83c7-d798abb1bdde
# ╟─b8b45c09-fa3b-4a77-a429-cab42e800776
# ╠═7216a6f8-28ae-4e9c-8273-ad86495ea465
# ╠═2841edc2-e177-494c-a1ba-f4a20b59b71d
# ╟─7560baf8-1bfe-46ff-8b2f-9945b0bd50c0
# ╠═25ca28e2-690a-4639-9a44-9b91888a354f
# ╠═87956312-9300-4f45-8485-90b6cee73fc4
# ╠═a0a4d1bc-0efc-4b20-a32d-e944212438c3
# ╠═a9f8bb58-04b0-4c08-8f32-9e22b40ed22d
# ╠═2d57f9d6-bc8f-498c-8eea-c95f4199f282
# ╠═1c0d0bf4-054f-48f7-a45a-3e1beb40455f
# ╠═d46c1d5a-fdf6-40da-ae10-7be67d8c65de
# ╠═d3904977-240c-401b-9fc5-6055d86d150d
# ╠═cfb97c37-4b71-4a85-8d61-ab9e3b64463c
# ╟─2764ab0e-9fde-4cee-81c3-28155a502280
# ╠═30707864-6cae-460b-a6b8-1140e14ec746
# ╟─236a77f5-5d52-48f9-a926-35b4521f849c
# ╠═9cae51d0-3a31-4d63-a17d-903eddb9e549
# ╟─ba17ba4b-635a-44cb-b4e4-58874300135c
# ╠═fd2bd59c-5090-41e8-a30b-2f9ebec303f3
# ╠═53b484b4-834c-448f-a562-88902cb38107
# ╟─0e613339-fd42-4484-b508-6c9ab482f7e8
# ╠═e4120f9e-cee0-4b6a-9c1b-79464473159b
# ╟─8b863fc7-17d2-4b37-92dc-296dafdb1a39
# ╠═9b15f12a-2a1d-4d16-8dd7-8ee73c624d02
# ╟─6e02fec2-e425-4825-ae5f-b75d895cd6a6
# ╠═c0ed499f-2746-4d3e-974f-f5ca8409a150
# ╟─b161dfc3-4b9c-43b0-83b1-fe06f452615f
# ╠═540eacdb-1c76-4516-86cc-6edfe1d8b9f8
# ╠═86801325-9b7d-4b11-bbf5-8517587967a9
# ╟─2526e3d9-0230-4b91-b5bb-5d6d027c5f63
# ╠═6ae6abe7-9361-4973-a686-9cd511e5cd96
# ╠═6af6640d-2a18-445a-bf13-30f366b65ddb
# ╠═b769ae49-e982-4763-8243-1fc172cb7520
# ╠═6698713f-14a1-48b3-80d7-18a0968aa6cb
# ╠═bfb84eb0-bf71-4dcc-aaa7-aa383fc84520
# ╠═be0c38da-d1c1-4d43-8a56-e204414036ba
# ╟─c59e7489-80cc-4551-8edf-eefb8eca0f0d
# ╠═fe3b6aa2-0711-433e-b903-65b1fb03167a
# ╠═0756a0e1-1991-44be-8d2d-c5f23ed55af8
# ╟─25b4ed13-796d-46dc-b3c4-86a60101575a
# ╠═e32575fc-ece6-4225-80ce-b3a4d4815a2c
# ╟─ba3e566a-d043-48e5-a170-0f7af0b6cb31
# ╠═2a1c01d4-6833-4cf0-8bc6-c959fab28b12
# ╠═f2d7758c-d9fc-4c6e-b14c-b52db3602d98
# ╟─3aa9ae04-275c-4d95-bb8e-2f70eb76f795
# ╠═270305b0-5315-4968-861c-255b2250f786
# ╟─94c315c0-bd8b-4796-99a1-2af97aee548d
# ╠═e007fc14-cd80-4a59-94d3-e97f0d5ce6b1
# ╟─11e0f424-02d2-4052-bee8-3e6e31dacce4
# ╠═cd8f55db-a3ee-45ac-bfe1-2634e31765b1
# ╠═20dd06d4-d36c-48ef-b133-941f861cb603
# ╟─2e3f5ef7-980a-4d7f-b1af-52dbc0b46a31
# ╠═7b15a2db-3213-40c5-82df-96d317b3f257
# ╟─268d719d-911e-4cfa-9d74-cc75b30aac92
# ╠═107a656e-be6f-43a8-a8a9-6b0d9e8c6ff2
# ╠═69d9d1fd-3cb0-4c33-986f-8b626c8dfd93
# ╟─21c50df0-ff26-4d06-819e-3d694a5ca4f7
# ╠═3ff29b8d-970f-4ebf-b0da-bcdb615b2a10
# ╟─f6e061bb-77d1-4691-a320-65c1a7c62d9f
# ╠═e1646097-6435-4bd2-b765-17495649a525
# ╟─d932bfe5-e925-40ab-9e2f-647784ba1780
# ╠═ed334667-c8d5-4f84-b579-97971affa25a
# ╠═aa5c3995-e0b1-4241-a6a1-76fd0659a715
# ╠═f5af072d-dbe0-4d6c-bbc2-63cc18f16956
# ╟─15adead7-df61-456a-a981-779930557d10
# ╟─80216946-d1a7-4672-9dd0-fcaf28b69072
# ╠═09b869ed-870a-400c-9c39-a01755eebf9e
# ╟─b67d5316-f3d3-4047-9b97-fbd8a20eda96
# ╟─406d3d4c-f210-48e0-9975-f918d98640cb
# ╟─a12b0cd3-71f1-4dc7-84d4-86788a0e6464
# ╠═7b4074c7-c159-47a9-a9f7-2cca66f16cdb
# ╠═9483bbf5-69b7-41d9-9606-22f0c8bdf4b2
# ╠═e2ab8d0b-b8f0-4c45-807f-f38cd96b89f8
# ╟─56bfce44-9912-4f69-96e4-500d81fe14bc
# ╟─aa129e6f-b7b1-4408-a82f-32be1df1ae3c
# ╠═1acfda65-be06-4be2-ade8-bd376359c240
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
