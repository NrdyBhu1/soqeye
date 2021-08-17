module Rendering where

import Graphics.Gloss
import Game
import Logic

window :: Display
window = InWindow "Pong" (screenWidth, screenHeight) (0, 0)

background :: Color
background = black

gameToPic :: Game -> Picture
gameToPic Game{gamePlayer=pp, gameAi=ai, gameScore=gs, gameBall=gb, gameState=_}
    = pictures [
    -- bg
        color bgColor $ rectangleSolid 640 480
    -- ai paddle
        , translate (fst ai - 250) ((snd ai)) $ color playerColor $ rectangleSolid 30 100
    -- player paddle
        , translate (fst pp + 250) (snd pp + 190) $ color playerColor $ rectangleSolid 30 100
    -- ball
        , translate (fst gb) (snd gb) $ color ballColor $ circleSolid 30 
    -- score
        , translate (-300) 190 $ scale 0.25 0.25 $ color white $ text $ show gs
    ]
    where
        bgColor = light (light black)
        playerColor = light (light blue)
        ballColor = dark red
