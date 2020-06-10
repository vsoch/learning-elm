module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)

-- Return a range from 1 to input n
-- https://package.elm-lang.org/packages/elm/core/latest/List#range


getNumbers : Int -> List Int
getNumbers n =
    List.range 1 n


squareOfSum : Int -> Int
squareOfSum n =
    getNumbers n
        |> List.sum
        |> square


square : Int -> Int
square x =
    x ^ 2



-- would this be better as a float?


sumOfSquares : Int -> Int
sumOfSquares n =
    getNumbers n
        |> List.map square
        |> List.sum


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n
