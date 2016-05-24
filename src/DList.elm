module DList exposing
  ( DList
  , toList
  , empty
  , singleton
  , fromList
  , cons
  , snoc
  , append
  )

{-| A representation of lists with an efficient append operation.

# Type
@docs DList, toList, empty, singleton, fromList, cons, snoc, append

-}


{-| TODO -}
type DList a = DList (List a -> List a)

{-| TODO -}
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

{-| TODO -}
cons : a -> DList a -> DList a
cons x (DList f) = DList <| (::) x << f

{-| TODO -}
snoc : DList a -> a -> DList a
snoc (DList f) x = DList <| f << (::) x

{-| TODO -}
append : DList a -> DList a -> DList a
append (DList f) (DList g) = DList <| f << g
