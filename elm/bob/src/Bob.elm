module Bob exposing (hey)


hey : String -> String
hey remark =
    let
        text =
            String.trim remark
    in
    if isQuestion text && isYelling text then
        "Calm down, I know what I'm doing!"

    else if isQuestion text then
        "Sure."

    else if isYelling text then
        "Whoa, chill out!"

    else if isEmpty text then
        "Fine. Be that way!"

    else
        "Whatever."



-- isQuestion takes a string and returns true if it ends with ?


isQuestion : String -> Bool
isQuestion remark =
    String.endsWith "?" remark



-- isYelling determines if rekark is equal to itself in all caps


isYelling : String -> Bool
isYelling remark =
    if String.any Char.isAlpha remark then
        String.filter Char.isAlpha remark
            |> String.all Char.isUpper

    else
        False



-- return true if provided an empty string


isEmpty : String -> Bool
isEmpty remark =
    String.isEmpty remark
