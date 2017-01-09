module Main where

import Prelude
import Signal (runSignal, (~>))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import DOM (DOM)
import Mouse (displayText, mousePosDisplay) 
import TextCount (boxText, displayButtonText)
import Data.String (length)

main :: forall e. Eff (console :: CONSOLE, dom :: DOM | e) Unit
main = do
  sig1 <- mousePosDisplay
  runSignal (sig1 ~> displayText)
  sig2 <- boxText
  runSignal $ sig2 ~> (\str -> show $ length str) ~> displayButtonText
