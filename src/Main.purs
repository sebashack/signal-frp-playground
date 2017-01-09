module Main where

import Prelude
import Signal
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import DOM (DOM)
import Mouse (displayText, mousePosDisplay)

main :: forall e. Eff (console :: CONSOLE, dom :: DOM | e) Unit
main = do
  sig <- mousePosDisplay
  runSignal (sig ~> displayText)
