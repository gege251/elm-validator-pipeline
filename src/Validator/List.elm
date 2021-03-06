module Validator.List exposing (minLength, maxLength, every)

{-| Validators for Lists.

@docs minLength, maxLength, every

-}

import Validator exposing (Validator, customValidator)


{-| Checks if a list is longer than or equal to a given number
-}
minLength : x -> Int -> Validator x (List a) (List a)
minLength errorMsg value =
    customValidator errorMsg (\tested -> List.length tested >= value)


{-| Checks if a list is shorter than or equal to a given number
-}
maxLength : x -> Int -> Validator x (List a) (List a)
maxLength errorMsg value =
    customValidator errorMsg (\tested -> List.length tested <= value)


{-| Checks if every item in a list passes the validation.

    List.every (String.letterOnly "All items must be letters only") [ "abc", "def" ] == Ok [ "abc", "def" ]

    List.every (String.letterOnly "All items must be letters only") [ "abc", "ab2c" ] == Err [ "All items must be letters only" ]

-}
every : Validator x a a -> Validator x (List a) (List a)
every validator =
    let
        compose =
            \item list ->
                Result.map2
                    (::)
                    (validator item)
                    list
    in
    List.foldr compose (Ok [])
