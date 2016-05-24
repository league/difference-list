module Main exposing (..)

import ElmTest exposing (..)
import Html exposing (pre, text)
import DList exposing (..)

tests : Test
tests =
  suite "Test the test framework"
          [ test "minimal" <| assertEqual 3 (1+2)
          , test "dlist" <| assertEqual 32 floop
          ]

main =
  pre [] [text (stringRunner tests)]
--  runSuite tests
