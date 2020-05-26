module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    case name of
        Just person ->
            "One for " ++ person ++ ", one for me."

        Nothing ->
            "One for you, one for me."
