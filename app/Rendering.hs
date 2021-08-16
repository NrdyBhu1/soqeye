module Rendering where

import Graphics.Gloss
import Game
import Logic

window :: Display
window = InWindow "Pong" (screenWidth, screenHeight) (0, 0)

background :: Color
background = black

gameToPic :: Game -> Picture
gameToPic Game{gameplayer=pp, gameai=ai, gamescore=gs, gameball=gb, gamestate=_}
    = pictures [
        color bgColor $ rectangleSolid 640 480
        , translate (fst ai - 250) ((snd ai)) $ color playerColor $ rectangleSolid 30 100
        , translate (fst pp + 250) (snd pp + 190) $ color playerColor $ rectangleSolid 30 100
        , translate (fst gb) (snd gb) $ color ballColor $ circleSolid 30 
        , translate (-300) 190 $ scale 0.25 0.25 $ color white $ text $ show gs
    ]
    where
        bgColor = light (light black)
        playerColor = light (light blue)
        ballColor = dark red
