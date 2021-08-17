module Logic where

import Game
import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Interact

speed :: Float -> Float
speed dt = 150*dt

-- updating ball
updateBallPos :: Float -> Game -> Game
updateBallPos dt game = game { gameBall = Ball { ballPos=(fst bp+(fst bv * speed dt), snd bp+ (snd bv * speed dt)), ballVel = bv } }
    where bv = ballVel $ gameBall game
          bp = ballPos $ gameBall game

updateBallX :: Game -> Game
updateBallX game 
    | (fst bp) >= (screenWidthF/2)-30 = game { gameBall = Ball { ballPos=bp, ballVel = (-(fst bv), snd bv) }}
    | (fst bp) <= (-screenWidthF/2)+30 = game { gameBall = Ball { ballPos=bp, ballVel = (abs $ fst bv, snd bv) }}
    | otherwise                = game
    where bv = ballVel $ gameBall game
          bp = ballPos $ gameBall game

updateBallY :: Game -> Game
updateBallY game
    | (snd bp) >= (screenHeightF/2)-30 = game { gameBall = Ball { ballPos=bp, ballVel = (fst bv, -(snd bv)) }}
    | (snd bp) <= (-screenHeightF/2)+30 = game { gameBall = Ball { ballPos=bp, ballVel = (fst bv, abs $ snd bv) }}
    | otherwise                = game
    where bv = ballVel $ gameBall game
          bp = ballPos $ gameBall game

-- moving the paddle
move :: (Float, Float) -> Game -> Game
move (x, y) game = game { gamePlayer = (fst player, y-190) }
    where player = gamePlayer game

-- updating the ball position
updateBall :: Float -> Game -> Game
updateBall dt game =
    case gameState game of
        GamePlaying -> updateBallPos dt $ updateBallY $ updateBallX game
        GameEnd -> game

-- updating the ai paddle position
-- ;) this is no ai, it just follows the ball's position
-- my code my wish
-- ;0 it works Pog
updateAi :: Game -> Game
updateAi game
    | (fst bp) > 0 = game
    | (fst bp) < 0 = game { gameAi = (fst ai, snd bp) }
    | otherwise = game
    where ai = gameAi game
          bp = ballPos $ gameBall game

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
        GamePlaying -> updateAi $ updateBall dt game
        GameEnd -> game

-- atom:set fileencoding=utf8 fileformat=unix filetype=haskell tabstop=2 expandtab:
