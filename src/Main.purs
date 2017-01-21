module Main where

import Prelude
import Accumulator (addButton, displayAccumValue, subtractButton)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import DOM (DOM)
import Data.String (length, toUpper)
import Merge (button2, link, displayBoxValue)
import Mouse (displayText, mousePosDisplay)
import Signal (Signal, runSignal, merge, sampleOn, filter, (~>))
import SnapShot (click, displayInput, boxInput)
import TextCount (boxText, displayButtonText)
import Validation (formInput, enableButton)

main :: forall e. Eff (console :: CONSOLE, dom :: DOM | e) Unit
main = do
  -- Examples of mapping a signal.
  sig1 <- mousePosDisplay
  runSignal (sig1 ~> displayText)
  sig2 <- boxText
  -- <---------------------------------
  runSignal $ sig2 ~> (\str -> show $ length str) ~> displayButtonText
  -- Example of merging two signals.
  sig3 <- button2
  sig4 <- link
  -- <---------------------------------
  runSignal $ (sig3 `merge` sig4) ~> displayBoxValue
  -- Example of sampling on two signals: A new signal
  -- which yields the current value of the text-box signal
  -- whenever the user clicks the button (the click
  -- signal.
  sig5 <- boxInput
  sig6 <- click
  runSignal $ (sig6 `sampleOn` sig5) ~> toUpper ~> displayInput
  -- <---------------------------------
  -- Example: A simple Accumulator
  sig7 <- addButton
  sig8 <- subtractButton
  runSignal $ (sig7 `merge` sig8) ~> displayAccumValue
  -- <---------------------------------
  -- A minimalistic input Validation
  sig9 <- formInput
  runSignal $ sig9 ~> (\str -> length str < 10) ~> enableButton
