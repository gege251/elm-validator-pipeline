module Test.Validator.List exposing (..)

import Expect
import Test exposing (..)
import Validator.List as List
import Validator.String as String


minTest : Test
minTest =
    describe "min"
        [ test "succeeds"
            (\_ -> Expect.equal (List.minLength "error" 2 [ 0, 1 ]) (Ok [ 0, 1 ]))
        , test "fails"
            (\_ -> Expect.equal (List.minLength "error" 2 [ 0 ]) (Err [ "error" ]))
        ]


maxTest : Test
maxTest =
    describe "max"
        [ test "succeeds"
            (\_ -> Expect.equal (List.maxLength "error" 2 [ 0, 1 ]) (Ok [ 0, 1 ]))
        , test "fails"
            (\_ -> Expect.equal (List.maxLength "error" 2 [ 0, 1, 2 ]) (Err [ "error" ]))
        ]


everyTest : Test
everyTest =
    describe "every"
        [ test "succeeds"
            (\_ -> Expect.equal (List.every (String.notEmpty "error") [ "abc", "def" ]) (Ok [ "abc", "def" ]))
        , test "fails"
            (\_ -> Expect.equal (List.every (String.notEmpty "error") [ "abc", "" ]) (Err [ "error" ]))
        ]
