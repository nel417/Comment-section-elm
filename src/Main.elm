
module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Comment =
    { name : String
    , description : String
    }

type alias Model =
    {newCommentText : String
    ,newCommentUser : String
    ,comments : List Comment
    }

type Msg
  = AddComment
  | ChangeNewCommentUser String
  | ChangeNewCommentText String

author : String -> Comment -> String
author currentUser { name } =
    if currentUser == name then
        name ++ "( You)"
    else
        name

update : Msg -> Model -> Model
update msg model =
  case msg of
    AddComment ->
      let
        comment = { name = ( "User " ++ model.newCommentUser ) , description = model.newCommentText }
      in
        { model
        | comments = comment :: model.comments
        , newCommentText = ""
        }
    
    ChangeNewCommentUser username ->
      { model | newCommentUser = username }
    ChangeNewCommentText description ->
      { model | newCommentText = description }

main =
    text "hotdog"