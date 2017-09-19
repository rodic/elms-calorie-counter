module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    Int


initModel : Model
initModel =
    0



-- update


type Msg
    = AddCalories
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalories ->
            model + 1

        Clear ->
            initModel



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model))
            ]
        , button
            [ type_ "button"
            , onClick AddCalories
            ]
            [ text "Add Calorie"
            ]
        , button
            [ type_ "button"
            , onClick Clear
            ]
            [ text "Clear"
            ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
