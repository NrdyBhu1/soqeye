module Logic where

import Game
import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Interact

handleEvents :: Event -> Game -> Game
handleEvents (EventKey (KeyButton 'w') Up _ _) game =
    case gameState game of
        GamePlaying -> game
        GameEnd -> game

handleEvents _ game = game
