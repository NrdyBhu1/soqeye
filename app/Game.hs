module Game where

import Graphics.Gloss

data GameState = GamePlaying | GameEnd
    deriving (Eq, Show)

data Game = Game {
    gamePlayer :: (Float, Float)
    , gameAi :: (Float, Float)
    , gameBall :: (Float, Float)
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
        , gameBall = (0, 0)
        , gameScore = 69
        , gameState = GamePlaying
    }
