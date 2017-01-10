module Main where

import Prelude
import Signal (runSignal, merge, (~>))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import DOM (DOM)
import Mouse (displayText, mousePosDisplay) 
import TextCount (boxText, displayButtonText)
import Merge (button2, link, displayBoxValue)
import Data.String (length)

main :: forall e. Eff (console :: CONSOLE, dom :: DOM | e) Unit
main = do
  -- Examples of mapping a signal.
  sig1 <- mousePosDisplay
  runSignal (sig1 ~> displayText)
  sig2 <- boxText
  runSignal $ sig2 ~> (\str -> show $ length str) ~> displayButtonText
  -- Example of merging two signals.
  sig3 <- button2
  sig4 <- link
  runSignal $ (sig3 `merge` sig4) ~> displayBoxValue
