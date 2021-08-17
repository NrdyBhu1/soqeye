module Main where

import Graphics.Gloss
import Game
import Rendering
import Logic

main :: IO ()
main = do
    play window background 30 initialGame gameToPic handleEvents updateGame
