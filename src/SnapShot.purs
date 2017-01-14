module SnapShot (boxInput, click, displayInput) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import DOM (DOM)
import Signal (Signal, constant)

foreign import signalInput :: forall eff c.
                              (c -> Signal c)
                           -> Eff (dom :: DOM | eff) (Signal String)

foreign import signalClick :: forall eff c.
                              (c -> Signal c)
                           -> Eff (dom :: DOM | eff) (Signal Unit)

foreign import displayInput :: forall eff. String
                            -> Eff (dom :: DOM | eff) Unit


boxInput :: forall eff. Eff (dom :: DOM | eff) (Signal String)
boxInput = signalInput constant

click :: forall eff. Eff (dom :: DOM | eff) (Signal Unit)
click = signalClick constant
