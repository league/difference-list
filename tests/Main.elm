module Main exposing (..)

import DList exposing (..)
import Expect exposing (equal)
import Test exposing (Test, describe, test)
import Test.Runner.Html

tests : Test
tests = describe "Difference lists"
        [ test "empty list is empty"
          <| \() -> equal []
          <| toList empty

        , test "singleton list contains one thing"
          <| \() -> equal [19]
          <| toList
          <| singleton 19

        , test "from-to empty list"
          <| \() -> equal []
          <| toList
          <| fromList []

        , test "from-to non-empty list"
          <| \() -> equal [18,21,74,8]
          <| toList
          <| fromList [18,21,74,8]

        , test "cons onto empty list"
          <| \() -> equal [23]
          <| toList
          <| cons 23 empty

        , test "cons onto non-empty list"
          <| \() -> equal [40, 21, 18]
          <| toList
          <| cons 40
          <| fromList [21, 18]

        , test "snoc onto empty list"
          <| \() -> equal [23]
          <| toList
          <| snoc empty 23

        , test "snoc onto non-empty list"
          <| \() -> equal [21, 18, 40]
          <| toList
          <| snoc (fromList [21, 18]) 40

        , test "append two non-empty lists"
          <| \() -> equal [34, 18, 91, 70]
          <| toList
          <| append (fromList [34, 18]) (fromList [91, 70])

        , test "append three singleton lists, right-associative"
          <| \() -> equal [18, 19, 20]
          <| toList
          <| append (singleton 18)
          <| append (singleton 19) (singleton 20)

        , test "append three singleton lists, left-associative"
          <| \() -> equal [18, 19, 20]
          <| toList
          <| append (append (singleton 18) (singleton 19)) (singleton 20)

        , test "append with empty list on left"
          <| \() -> equal [40, 21]
          <| toList
          <| append empty (fromList [40, 21])

        , test "append with empty list on right"
          <| \() -> equal [40, 21]
          <| toList
          <| append (fromList [40, 21]) empty

        , test "append two empty lists"
          <| \() -> equal []
          <| toList
          <| append empty empty

        , test "append using operator"
          <| \() -> equal [13, 81, 19]
          <| toList
          <| singleton 13 +&+ fromList [81] +&+ empty +&+ singleton 19 +&+ empty

        , test "map over a non-empty list"
          <| \() -> equal ["21", "88", "93"]
          <| toList
          <| map toString
          <| fromList [21, 88, 93]

        , test "fold over an empty list"
          <| \() -> equal 1
          <| foldr (*) 1 empty

        , test "fold over non-empty list"
          <| \() -> equal 120
          <| foldr (*) 1
          <| fromList [5,4,3,2]

        , test "concat a list of dlists"
          <| \() -> equal [13, 81, 99, 40]
          <| toList
          <| concat [ singleton 13
                    , empty
                    , fromList [81, 99]
                    , empty
                    , singleton 40
                    , empty
                    ]

        , test "intersperse a list into a list of dlists"
          <| \() -> equal [15, 0, 81, 17, 0, 99]
          <| toList
          <| intersperse (singleton 0)
             [ singleton 15
             , fromList [81, 17]
             , singleton 99
             ]
        ]

main =
    Test.Runner.Html.run tests
