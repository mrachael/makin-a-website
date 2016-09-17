import Html exposing (Html, button, div, input, text)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html.Events exposing (onInput)



main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model =
  { theSpeak : String
  , yell : String
  }


model : Model
model =
  { theSpeak = "Everything fine"
  , yell = "DEFAULT YELL"
  }



-- UPDATE

--Messages from the UI
type Msg
  = Yell
  | SetYell String
  | Okay


update : Msg -> Model -> Model
update msg model =
  case msg of
    Yell ->
      { model | theSpeak = model.yell }

    SetYell theWords ->
      { model | yell = "YELLING: " ++ theWords }

    Okay ->
      { model | theSpeak = "Everything fine" }

-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ div [] [ text "How it be?" ]
    , button [ onClick Okay ] [ text "things are okay" ]
    , div []
      [ input  [ placeholder "What to yell?", onInput SetYell] []
      , button [ onClick Yell ] [ text "YELL" ]
      ]
    , text (model.theSpeak)
    ]
