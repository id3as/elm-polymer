module Polymer.Events exposing
    ( onIronSelect
    , onSelectedChanged
    , onTap
    , onValueChanged
    )

{-|

@docs onIronSelect
@docs onSelectedChanged
@docs onTap
@docs onValueChanged

-}

import Html exposing (Attribute)
import Html.Events exposing (on)
import Json.Decode exposing (Decoder, andThen, at, map, string, succeed)


{-| -}
onIronSelect : (String -> msg) -> Attribute msg
onIronSelect tagger =
    map tagger detailValue |> on "iron-select"


{-| -}
onTap : msg -> Attribute msg
onTap msg =
    succeed msg |> on "tap"


{-| -}
onSelectedChanged : (String -> msg) -> Attribute msg
onSelectedChanged =
    onChanged "selected"


{-| -}
onValueChanged : (String -> msg) -> Attribute msg
onValueChanged =
    onChanged "value"


onChanged : String -> (String -> msg) -> Attribute msg
onChanged property tagger =
    map tagger detailValue |> on (property ++ "-changed")


detailValue : Decoder String
detailValue =
    at [ "detail", "value" ] string
