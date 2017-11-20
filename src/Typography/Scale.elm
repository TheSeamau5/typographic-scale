module Typography.Scale exposing (..)
{-| Module for creating and using typographic scales.

# Definition
@docs Scale, makeScale

# Golden Ratio
@docs goldenRatio

# Musical Scales

### Major Scales
@docs majorSecond, majorThird, majorSixth, majorSeventh

### Minor Scales
@docs minorSecond, minorThird, minorSixth, minorSeventh

### Perfect Scales
@docs perfectFourth, perfectFifth, perfectOctave

### Augmented Scales
@docs augmentedSecond, augmentedThird, augmentedFourth, augmentedFifth, augmentedSixth, augmentedSeventh, augmentedOctave

-}

{-| Scale type.

A Scale is a function that scales some pre-defined base value by some
pre-defined factor and a given exponent.

-}
type alias Scale = Int -> Float


{-| Function to create a scale.

`makeScale` is defined as follows :

    makeScale : Float -> Float -> Scale
    makeScale factor base exponent =
      base * (factor ^ toFloat exponent)

This can easily allow you to create all sorts of scales,
for example:

    majorThird = makeScale 1.250


So, say you start from a baseline of `12pt`. If you apply this
scale with different exponents you get:

    majorThird 12 0 == 12 * (1.250 ^ 0) == 12

    majorThird 12 1 == 12 * (1.250 ^ 1) == 15

    majorThird 12 2 == 12 * (1.250 ^ 1) == 18.75

And, now, by just incrementing and decrementing the exponent, you
can set the font sizes for you titles, headings, body, legalese, etc...

-}
makeScale : Float -> Float -> Scale
makeScale factor base exponent =
  base * (factor ^ toFloat exponent)


------------------
-- Minor Scales --
------------------

{-| In music theory, a minor second is the interval between two adjacent notes
(or notes a semitone apart).

This size of the interval is `16 : 15`.
-}
minorSecond : Float -> Scale
minorSecond =
  makeScale ( 16 / 15 )


{-| In music theory, a minor third is the interval encompassing three semitones.

The size of the interval is `6 : 5`
-}
minorThird : Float -> Scale
minorThird =
  makeScale ( 6 / 5 )



{-| The size of the interval is `8 : 5`
-}
minorSixth : Float -> Scale
minorSixth =
  makeScale ( 8 / 5 )


{-| The size of the interval is `16 : 9`
-}
minorSeventh : Float -> Scale
minorSeventh =
  makeScale ( 16 / 9 )


------------------
-- Major Scales --
------------------

{-| In music theory, a major second is the interval encompassing two adjacent
notes (or between notes two semitones apart).

The size of the interval is `9 : 8`
-}
majorSecond : Float -> Scale
majorSecond =
  makeScale ( 9 / 8 )


{-| The size of the interval is `5 : 4`
-}
majorThird : Float -> Scale
majorThird =
  makeScale 1.250


{-| The size of the interval is `27 : 16`
-}
majorSixth : Float -> Scale
majorSixth =
  makeScale ( 27 / 16 )


{-| The size of the interval is `15 : 8`
-}
majorSeventh : Float -> Scale
majorSeventh =
  makeScale ( 15 / 8 )


--------------------
-- Perfect Scales --
--------------------

{-| The size of the interval is `4 : 3`
-}
perfectFourth : Float -> Scale
perfectFourth =
  makeScale 1.333


{-| The size of the interval is `3 : 2`
-}
perfectFifth : Float -> Scale
perfectFifth =
  makeScale 1.500


{-| The size of the interval is `2 : 1`
-}
perfectOctave : Float -> Scale
perfectOctave =
  makeScale 2


----------------------
-- Augmented Scales --
----------------------

{-| The size of the interval is `75 : 64`
-}
augmentedSecond : Float -> Scale
augmentedSecond =
  makeScale ( 75 / 64 )


{-| The size of the interval is `125 : 96`
-}
augmentedThird : Float -> Scale
augmentedThird =
  makeScale ( 125 / 96 )

{-| The size of the interval is `45 : 32`
-}
augmentedFourth : Float -> Scale
augmentedFourth =
  makeScale 1.414


{-| The size of the interval is `25 : 16`
-}
augmentedFifth : Float -> Scale
augmentedFifth =
  makeScale ( 25 / 16 )

{-| The size of the interval is `7 : 4`
-}
augmentedSixth : Float -> Scale
augmentedSixth =
  makeScale ( 7 / 4 )

{-| The size of the interval is `125 : 64`
-}
augmentedSeventh : Float -> Scale
augmentedSeventh =
  makeScale ( 125 / 64 )

{-| The size of the interval is `25 : 12`
-}
augmentedOctave : Float -> Scale
augmentedOctave =
  makeScale ( 25 / 12 )

-------------------
-- Common Scales --
-------------------

{-| The size of the interval is `1.618`
-}
goldenRatio : Float -> Scale
goldenRatio =
  makeScale ( (1 + sqrt 5) / 2 )
