module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { calories : Int
    , increment : Int
    }


initModel : Model
initModel =
    { calories = 0
    , increment = 0
    }



-- update


type Msg
    = AddCalories
    | Clear
    | UpdateIncrement String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalories ->
            { calories = model.calories + model.increment
            , increment = 0
            }

        Clear ->
            initModel

        UpdateIncrement n ->
            case String.toInt n of
                Err msg ->
                    model

                Ok value ->
                    { model | increment = value }



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model.calories))
            ]
        , input
            [ type_ "text"
            , onInput UpdateIncrement
            ]
            [ text (toString model.increment)]
        , br [] []
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
