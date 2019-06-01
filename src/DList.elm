module DList exposing
    ( DList, toList
    , empty, singleton, cons, snoc, append, fromList
    , concat, foldr, intersperse, map
    )

{-| A representation of lists with an efficient append operation.

This is particularly useful for efficient logging and pretty printing, where
repeatedly appending lists quickly becomes too expensive. Internally, `DList`
is a function that prepends elements to its parameter. Thus the `append`
operation is just function composition. Ultimately, a `DList` is converted to a
regular `List` by applying the function to the empty list.

Some limitations of the `DList` representation are:

  - We cannot ask for the length of a `DList` without converting it to a
    regular list.

  - We cannot test equality on two `DList` structures without converting them
    to regular lists.

@docs DList, toList


# Construction

@docs empty, singleton, cons, snoc, append, fromList


# Processing

@docs concat, foldr, intersperse, map

-}


{-| A difference list containing elements of type `a`.
-}
type DList a
    = DList (List a -> List a)


{-| Convert to a regular Elm `List` by applying the underlying function
representation.
-}
toList : DList a -> List a
toList (DList f) =
    f []


{-| The empty list.
-}
empty : DList a
empty =
    DList identity


{-| Construct a list containing one element.
-}
singleton : a -> DList a
singleton =
    DList << (::)


{-| Convert a regular Elm `List` to a difference list.
-}
fromList : List a -> DList a
fromList =
    DList << (++)


{-| Prepend an element onto the front of the list.
-}
cons : a -> DList a -> DList a
cons x (DList f) =
    DList <| (::) x << f


{-| Add an element onto the back of the list. O(1) just like `append`.
-}
snoc : DList a -> a -> DList a
snoc (DList f) x =
    DList <| f << (::) x


{-| Concatenate two lists.
-}
append : DList a -> DList a -> DList a
append (DList f) (DList g) =
    DList <| f << g


{-| Iterate through a `DList`.
-}
foldr : (a -> b -> b) -> b -> DList a -> b
foldr f b =
    List.foldr f b << toList


{-| Apply a function to each element, accumulating the results as a `DList`.
-}
map : (a -> b) -> DList a -> DList b
map f =
    foldr (cons << f) empty


{-| Concatenate a list of difference lists.
-}
concat : List (DList a) -> DList a
concat =
    List.foldr append empty


{-| Intersperse the contents of a `DList` between other lists.
-}
intersperse : DList a -> List (DList a) -> DList a
intersperse x xs =
    concat <| List.intersperse x xs
