module Game where

import Graphics.Gloss

data GameState = GamePlaying | GameEnd
    deriving (Eq, Show)

data Ball = Ball {
    ballPos :: (Float, Float)
    , ballVel :: (Float, Float)
} deriving (Eq, Show)

data Game = Game {
    gamePlayer :: (Float, Float)
    , gameAi :: (Float, Float)
    , gameBall :: Ball
    , gameScore :: Int
    , gameState :: GameState
    } deriving (Eq, Show)

screenWidth :: Int
screenWidth = 640

screenHeight :: Int
screenHeight = 480

screenWidthF :: Float
screenWidthF = 640

screenHeightF :: Float
screenHeightF = 480

initialGame = Game {
        gamePlayer = (0, 0)
        , gameAi = (0, 100)
        , gameBall = Ball { ballPos = (0, 0), ballVel = (1, 1)}
        , gameScore = 69
        , gameState = GamePlaying
    }
