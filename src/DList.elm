module DList exposing
  ( DList
  , toList
  , empty
  , singleton
  , fromList
  )

{-| A representation of lists with an efficient append operation.

# Type
@docs DList, toList, empty, singleton, fromList

-}


{-| Blah the type. -}
type DList a = DList (List a -> List a)

{-| whatever. -}
empty : DList a
empty = DList identity

{-| TODO -}
toList : DList a -> List a
toList (DList f) = f []

{-| TODO -}
singleton : a -> DList a
singleton = DList << (::)

{-| TODO -}
fromList : List a -> DList a
fromList = DList << (++)
