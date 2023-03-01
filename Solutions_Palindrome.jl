function first(word)
    first = firstindex(word)
    word[first]
end

function last(word)
    last = lastindex(word)
    word[last]
end

function middle(word)
    first = firstindex(word)
    last = lastindex(word)
    word[nextind(word, first) : prevind(word, last)]
end

function ispalindrome(word)
    if length(word) < 2
        return true
    end
    if last(word) != first(word)
        return false
    end
    return ispalindrome(middle(word))
end