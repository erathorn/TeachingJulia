### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

# ╔═╡ a2044473-9db5-4211-9801-d764332d066a
md"
## Working with files
"

# ╔═╡ bfc4bc10-2c5b-4ccc-a8bd-7bfb2dbc5780
md"
First create a file handle.
"

# ╔═╡ 7589af1d-38e9-49a5-9c43-1915c2e1f669
f = open("../Resources/MyText.txt")

# ╔═╡ 62c0cc02-c0d0-458d-89db-2966eade7d9f
md"
Read each line in the file.
"

# ╔═╡ 13d39a5c-21d3-4132-bf9f-4e6e55929ebe
content = readlines(f)

# ╔═╡ 81532888-a3d2-49c2-88dc-c6afc6614108
md"
Do not forget to close the file handle.
"

# ╔═╡ 1e23683c-4a87-45bd-997d-dcc281818de9
close(f)

# ╔═╡ eb5162b1-2e03-426a-9cd0-a0686d6b2868
content

# ╔═╡ a3687ad2-2654-436a-85c1-edcefd92a64e
md"
However, it is recomended to use a do-block. At the end of the do-block the file will be closed automatically:
"

# ╔═╡ 189dc8ef-e021-4a78-9623-7632aba69758
open("../Resources/MyText.txt") do f
    # read from file
    lines = readlines(f)
end

# ╔═╡ 4c9bf50e-ab45-403e-a999-8029789ecad0
md"
## Types Continued

> REMEBER: Everything in Julia has a type. This is a core component of the language und one of the reasons for its performance.

Declaring Types is not required. However, Julia infers and uses the types of objects at runtime.

> Abstract types cannot be instantiated, and serve only as nodes in the type graph, thereby describing sets of related concrete types: those concrete types which are their descendants.

> A primitive type is a concrete type whose data consists of plain old bits. Classic examples of primitive types are integers and floating-point values.
"

# ╔═╡ 5638e587-040d-4edf-971b-799a5bc587a1
md"
### Composite Types

Composite Types are the most commonly user-defined types in Julia. It is a collection of named fields and an instance of a composite type is a single value.

A new composite type is introduced using the `struct` keyword.
"

# ╔═╡ 71d9dbc4-529c-4071-908e-790bb2593190
struct Point2D
	x
	y
end

# ╔═╡ 52f0a6aa-b43b-11ed-0e6b-f978e4dfcf09
md"
This piece of code creates an **immutable** struct, where the fields `x` and `y` can be of any type, i.e. the fields `x` and `y` get annotated with the default type `Any`. Using the keyword `mutable struct` we can introduce a **mutable** struct.

"

# ╔═╡ 217a26d6-9df3-4e03-82fe-d51e8448444d
mutable struct MPoint2D
	x
	y
end

# ╔═╡ 0ca14f19-6654-4cbb-9369-30fe1fe89835
md"
> Sidenote: We cannot redefine structs! Therefore I had to use a new name for the mutable version of the struct.

A new instance of a struct can easily be created.
"

# ╔═╡ 22f7fc4c-1f9d-46d0-a64c-fadc06db9178
p = MPoint2D(3.4, 2.2)

# ╔═╡ fd20b634-2637-4d7e-81b9-c5febc18396a
md"
The fields are accessed by their names.
"

# ╔═╡ 96bd0dc6-aff0-419a-9cfd-a1b7efcd969b
p.x, p.y

# ╔═╡ bad5722b-0419-43a2-b384-0f3f1b53d5d2
md"The fields of structs can be annotated with types."

# ╔═╡ 2ae4c866-d4ba-4199-95da-e5ae0ecdd3bf
	mutable struct TPoint2D
		x::Float64
		y::Float64
	end

# ╔═╡ e537adcc-1023-4982-9f8e-bf3cb96f94d5
md"
### Constructors

A *constructor* is a function which creates a new object. Julia distinguishes between outer and inner constructors. Type objects such as `TPoint2D` function as constructor functions in Julia already. However, you can define your own constructor functions as well.

#### Outer constructors

An outer constructor is nothing but another function. Assume we want to define a constructor for a point which is located on the diagonal, i.e. x and y value are equal. We can acchieve this through an outer constructor.

#### Inner constructors

Inner constructors are defined inside the definition of the struct. They replace Julia's default constructor. These instances are useful if your struct needs to fulfill certain characteristics, which you need to enforce on creation.
"

# ╔═╡ 4f9eac83-e820-492d-ae34-a691dadd1c32
begin
	struct PositivePoint2D
		x::Float64
		y::Float64

		PositivePoint2D(x, y) = (x >= 0 && y >= 0) ? new(x, y) : error("x or y are not positive")
	end
	
	PositivePoint2D(x) = PositivePoint2D(x, x) 
end

# ╔═╡ dc2b0bc9-7a8c-4167-85c9-36c2c6b4dc4a
md"

### Parametric Types

A powerful feature of Julias's type system is its capability to allow types to take parameters. 
"

# ╔═╡ 89621d72-f180-4a5f-9caf-158e6a36b6b0
struct Point{T}
	x::T
	y::T
end

# ╔═╡ d2404a83-ea7b-495f-8a37-45f8924def09
md"
We have defined a parametric type Point `Point{T}`. It has two fields, which are of type `T`. The actual type of `T` can be anything. A `Point{Float64}` is a concrete version of the parameteric type, with `x` and `y` being of type `Float64`. Similarly for `Point{Int64}`, `Point{Array{Float64}}` ... 

A `Point` in itself is a valid type object, with its respective concrete types as subtypes.
"

# ╔═╡ 5cd434bf-a6d2-4cfe-9fc3-ed33a6074eec
Point{Float64} <: Point

# ╔═╡ 2e30a2ae-57db-4ba8-8c4a-8e016b40a928
Point{AbstractString} <: Point

# ╔═╡ 13ee1934-f91b-4ac8-a9a5-d18aaab26c7f
md"
As expected, other types are not a subtype.
"

# ╔═╡ 0eb3624b-ef7d-42d5-8c58-17518daea5e1
Float64 <: Point

# ╔═╡ 484464ba-726a-4583-aaa6-52944599c2d0
md"
Although `Float64` is a subtype of `Real`, this is not the case for the different Point versions.
"

# ╔═╡ 9cf304d8-0087-4f45-bc5b-4f59ec6ec607
 Point{Float64} <: Point{Real}

# ╔═╡ a9cd095f-4713-441e-8f3d-ef6cadbef293
md"
The exact type of `Point` will be instantiated upon creation.
"

# ╔═╡ 47d0a9ea-e68f-4cb2-9f73-0900553da1c9
Point(1,2)

# ╔═╡ e86b297b-6aa9-4b60-8160-96b1ef1496dc
Point(1.2, 2.3)

# ╔═╡ b83e939f-90f4-4e44-8caf-ba5d59605ebc
md"
## Multiple Dispatch

Julia uses the multiple dispatch as its key paradigm.

> A specific Function/Method is determined based on the runtime type of the argument(s).

Julia follows a duck typing approach. (\"If it walks like a duck and it quacks like a duck, then it must be a duck\")

> Note: Function overloading vs. multiple dispatch ([YouTube](https://www.youtube.com/watch?v=kc9HwsxE1OY) and the effectiveness of multiple dispatch.)
"

# ╔═╡ 15b8cfc1-e8b8-4727-a45a-5a20f4833f35
begin
	struct Rectangle
    	width::Float64
    	height::Float64
	end
	width(r::Rectangle) = r.width
	height(r::Rectangle) = r.height

	struct Square
    	length::Float64
	end
	width(s::Square) = s.length
	height(s::Square) = s.length

	area(shape) = width(shape) * height(shape)
end

# ╔═╡ 1b725a48-ea47-4f19-bbbc-95389b6772ba
r = Rectangle(3, 4)

# ╔═╡ 3e42bf09-8b68-401b-a51a-838853cf116c
s = Square(3)

# ╔═╡ 227ffbe4-3fb6-42c6-a2b1-9de6a55efbdd
md"
There are specific versions of `width` and `height` for the different shapes. The appropriate method gets selected upon runtime, depending on the type of the shape.
"

# ╔═╡ 477441fe-b6e9-4b1f-8da2-a4ecbf66000a
area(r)

# ╔═╡ e9fa75ea-aa69-4073-a4ef-5e882a167ba3
area(s)

# ╔═╡ cb8ab8e5-e8f2-4c5a-b1c0-5c557bcf4cd7
md"
## Exercises
"

# ╔═╡ a1738179-3236-4b96-a0ec-0eaa5045de22
md"
### Exercise 1

Write a mutable struct called `Ship` with two fields: `name` (which is a String) and location, which is a `Point` (define the Point type if needed).

Then write a function `move!()` which takes three arguments: a Ship object, and two displacements, `dx` and `dy`.

Finally create a `Ship` object with a name and initial location, and call the `move!()` method on it. Print the Ship object to see if it has moved.

> Optional 1: Write an outer constructor for Ship which, instead of a Point object, takes x and y coordinates in separate arguments.

> Optional 2: Write another method for the `move!()` where the x and y displacements are defined by a Point type.

"

# ╔═╡ 198081cf-d88b-4281-bf16-b8e7a0bed530
md"
### Exercise 2

Write a function which opens and reads a file and returns the number of words in it. Here are example codes for this task in other languages which you can translate (You can use the lorem ipsum file from this course to test your function):

Here are some examples for reference:

**R**
```R
countwordoccurrence_in_file <- function(file_name, word) {
	count <- 0
	for (line in readLines(file_name)) {
    	words <- strsplit(line, ' ')[[1]]
    	count <- count + sum(words == word)
	}
	count
}
```

**Python**
```Python
def count_word_occurrence_in_file(file_name, word):
    count = 0
    with open(file_name, 'r') as f:
        for line in f:
            words = line.split()
            count += words.count(word)
    return count

```

"

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
# ╟─a2044473-9db5-4211-9801-d764332d066a
# ╟─bfc4bc10-2c5b-4ccc-a8bd-7bfb2dbc5780
# ╠═7589af1d-38e9-49a5-9c43-1915c2e1f669
# ╟─62c0cc02-c0d0-458d-89db-2966eade7d9f
# ╠═13d39a5c-21d3-4132-bf9f-4e6e55929ebe
# ╟─81532888-a3d2-49c2-88dc-c6afc6614108
# ╠═1e23683c-4a87-45bd-997d-dcc281818de9
# ╠═eb5162b1-2e03-426a-9cd0-a0686d6b2868
# ╟─a3687ad2-2654-436a-85c1-edcefd92a64e
# ╠═189dc8ef-e021-4a78-9623-7632aba69758
# ╟─4c9bf50e-ab45-403e-a999-8029789ecad0
# ╟─5638e587-040d-4edf-971b-799a5bc587a1
# ╠═71d9dbc4-529c-4071-908e-790bb2593190
# ╟─52f0a6aa-b43b-11ed-0e6b-f978e4dfcf09
# ╠═217a26d6-9df3-4e03-82fe-d51e8448444d
# ╟─0ca14f19-6654-4cbb-9369-30fe1fe89835
# ╠═22f7fc4c-1f9d-46d0-a64c-fadc06db9178
# ╟─fd20b634-2637-4d7e-81b9-c5febc18396a
# ╠═96bd0dc6-aff0-419a-9cfd-a1b7efcd969b
# ╠═bad5722b-0419-43a2-b384-0f3f1b53d5d2
# ╠═2ae4c866-d4ba-4199-95da-e5ae0ecdd3bf
# ╟─e537adcc-1023-4982-9f8e-bf3cb96f94d5
# ╠═4f9eac83-e820-492d-ae34-a691dadd1c32
# ╟─dc2b0bc9-7a8c-4167-85c9-36c2c6b4dc4a
# ╠═89621d72-f180-4a5f-9caf-158e6a36b6b0
# ╟─d2404a83-ea7b-495f-8a37-45f8924def09
# ╠═5cd434bf-a6d2-4cfe-9fc3-ed33a6074eec
# ╠═2e30a2ae-57db-4ba8-8c4a-8e016b40a928
# ╠═13ee1934-f91b-4ac8-a9a5-d18aaab26c7f
# ╠═0eb3624b-ef7d-42d5-8c58-17518daea5e1
# ╟─484464ba-726a-4583-aaa6-52944599c2d0
# ╠═9cf304d8-0087-4f45-bc5b-4f59ec6ec607
# ╠═a9cd095f-4713-441e-8f3d-ef6cadbef293
# ╠═47d0a9ea-e68f-4cb2-9f73-0900553da1c9
# ╠═e86b297b-6aa9-4b60-8160-96b1ef1496dc
# ╟─b83e939f-90f4-4e44-8caf-ba5d59605ebc
# ╠═15b8cfc1-e8b8-4727-a45a-5a20f4833f35
# ╠═1b725a48-ea47-4f19-bbbc-95389b6772ba
# ╠═3e42bf09-8b68-401b-a51a-838853cf116c
# ╟─227ffbe4-3fb6-42c6-a2b1-9de6a55efbdd
# ╠═477441fe-b6e9-4b1f-8da2-a4ecbf66000a
# ╠═e9fa75ea-aa69-4073-a4ef-5e882a167ba3
# ╟─cb8ab8e5-e8f2-4c5a-b1c0-5c557bcf4cd7
# ╟─a1738179-3236-4b96-a0ec-0eaa5045de22
# ╟─198081cf-d88b-4281-bf16-b8e7a0bed530
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
