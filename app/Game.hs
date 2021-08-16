module Game where

import Graphics.Gloss

data GameState = GamePlaying | GameEnd
    deriving (Eq, Show)

data Game = Game {
    gameplayer :: (Float, Float)
    , gameai :: (Float, Float)
    , gameball :: (Float, Float)
    , gamescore :: Int
    , gamestate :: GameState
    } deriving (Eq, Show) 

screenWidth :: Int
screenWidth = 640

screenHeight :: Int
screenHeight = 480

initialGame = Game {
        gameplayer = (0, 0)
        , gameai = (0, 100)
        , gameball = (0, 0)
        , gamescore = 69
        , gamestate = GamePlaying
    }
