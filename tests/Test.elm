module Main exposing (..)

import ElmTest exposing (..)
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

        , test "cons onto empty list"
          <| assertEqual [23]
          <| toList
          <| cons 23 empty

        , test "cons onto non-empty list"
          <| assertEqual [40, 21, 18]
          <| toList
          <| cons 40
          <| fromList [21, 18]

        , test "snoc onto empty list"
          <| assertEqual [23]
          <| toList
          <| snoc empty 23

        , test "snoc onto non-empty list"
          <| assertEqual [21, 18, 40]
          <| toList
          <| snoc (fromList [21, 18]) 40

        , test "append two non-empty lists"
          <| assertEqual [34, 18, 91, 70]
          <| toList
          <| append (fromList [34, 18]) (fromList [91, 70])

        , test "append three singleton lists, right-associative"
          <| assertEqual [18, 19, 20]
          <| toList
          <| append (singleton 18)
          <| append (singleton 19) (singleton 20)

        , test "append three singleton lists, left-associative"
          <| assertEqual [18, 19, 20]
          <| toList
          <| append (append (singleton 18) (singleton 19)) (singleton 20)

        , test "append with empty list on left"
          <| assertEqual [40, 21]
          <| toList
          <| append empty (fromList [40, 21])

        , test "append with empty list on right"
          <| assertEqual [40, 21]
          <| toList
          <| append (fromList [40, 21]) empty

        , test "append two empty lists"
          <| assertEqual []
          <| toList
          <| append empty empty

        , test "append using operator"
          <| assertEqual [13, 81, 19]
          <| toList
          <| singleton 13 +&+ fromList [81] +&+ empty +&+ singleton 19 +&+ empty

        , test "map over a non-empty list"
          <| assertEqual ["21", "88", "93"]
          <| toList
          <| map toString
          <| fromList [21, 88, 93]

        , test "fold over an empty list"
          <| assertEqual 1
          <| foldr (*) 1 empty

        , test "fold over non-empty list"
          <| assertEqual 120
          <| foldr (*) 1
          <| fromList [5,4,3,2]

        , test "concat a list of dlists"
          <| assertEqual [13, 81, 99, 40]
          <| toList
          <| concat [ singleton 13
                    , empty
                    , fromList [81, 99]
                    , empty
                    , singleton 40
                    , empty
                    ]

        , test "intersperse a list into a list of dlists"
          <| assertEqual [15, 0, 81, 17, 0, 99]
          <| toList
          <| intersperse (singleton 0)
             [ singleton 15
             , fromList [81, 17]
             , singleton 99
             ]
        ]

main =
  runSuite tests
