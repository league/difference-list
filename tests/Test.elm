module Main exposing (..)

import ElmTest exposing (..)
import Html exposing (pre, text)
import DList exposing (..)

tests : Test
tests = suite "Difference lists"
        [ test "empty list is empty"
          <| assertEqual []
          <| toList empty

        , test "singleton list contains one thing"
          <| assertEqual [19]
          <| toList
          <| singleton 19

        , test "from-to empty list"
          <| assertEqual []
          <| toList
          <| fromList []

        , test "from-to non-empty list"
          <| assertEqual [18,21,74,8]
          <| toList
          <| fromList [18,21,74,8]
        ]

main =
  runSuite tests
