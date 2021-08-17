module Logic where

import Game
import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Interact

speed :: Float -> Float
speed dt = 100*dt

-- updating ball 
updateBallX :: Float -> Game -> Game
updateBallX dt game
    | (fst ball) >= -(screenHeightF/2)+30
        && (fst ball) <= screenWidthF/2 - 30 = game { gameBall = ((fst ball)+speed dt, snd ball) }
    | otherwise     = game
    where ball = gameBall game

updateBallY :: Float -> Game -> Game
updateBallY dt game
    | (snd ball) >= -(screenHeightF/2)+30 
        && (snd ball) <= screenHeightF/2 - 30 = game { gameBall = (fst ball, (snd ball)+speed dt) }
    | otherwise     = game
    where ball = gameBall game

-- moving the paddle
move :: (Float, Float) -> Game -> Game
move (x, y) game = game { gamePlayer = (fst player, y-190) }
    where player = gamePlayer game

-- updating the ball position
updateBall :: Float -> Game -> Game
updateBall dt game = updateBallX dt $ updateBallY dt game

-- handling input
handleEvents :: Event -> Game -> Game
handleEvents (EventMotion mousePos) game = 
    case gameState game of
        GamePlaying -> move mousePos game
        GameEnd -> game
handleEvents _ game = game

-- updating the game
updateGame :: Float -> Game -> Game
updateGame dt game = 
    case gameState game of
        GamePlaying -> updateBall dt game
        GameEnd -> game
