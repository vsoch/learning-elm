module Gigasecond exposing (add)

import Time



-- Add a gigasecond 10^9 (1,000,000,000) seconds


add : Time.Posix -> Time.Posix
add timestamp =
    Time.millisToPosix (Time.posixToMillis timestamp + gigasecond)


gigasecond : Int
gigasecond =
    10 ^ 12
