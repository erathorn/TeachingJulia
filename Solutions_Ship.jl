struct Point{T}
    x::T
    y::T
end

mutable struct Ship
    name::String
    location::Point
end

function move!(s::Ship, dx, dy)
    oldloc = s.location
    s.location = Point(oldloc.x+dx, oldloc.y+dy)
end

Titanic = Ship("HMS Titanic", Point(1.0,2.0))
# Ship("HMS Titanic", Point{Float64}(1.0, 2.0))

move!(Titanic, 2, 5)
print(Titanic)
# Ship("HMS Titanic", Point{Float64}(3.0, 7.0))

# outer constructor
Ship(name, x, y) = Ship(name, Point(x,y))
SantaMaria = Ship("Santa Maria", 4.0, 2.0)
# Ship("Santa Maria", Point{Float64}(4.0, 2.0))

# new method
function move!(s::Ship, p::Point)
    oldloc = s.location
    s.location = Point(oldloc.x+p.x, oldloc.y+p.y)
end

move!(Titanic, Point(2,2))
print(Titanic)
# Ship("Titanic", Point{Float64}(5.0, 9.0))