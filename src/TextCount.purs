module TextCount (boxText, displayButtonText) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import DOM (DOM)
import Signal (Signal, constant)

foreign import signalText :: forall eff c.
                             (c -> Signal c)
                          -> Eff (dom :: DOM | eff) (Signal String)

foreign import displayButtonText :: forall eff. 
                                    String
                                 -> Eff (dom :: DOM | eff) Unit

boxText :: forall eff. Eff (dom :: DOM | eff) (Signal String)
boxText = signalText constant
