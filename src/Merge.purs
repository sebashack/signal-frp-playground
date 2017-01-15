module Merge (button2, link, displayBoxValue) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import DOM (DOM)
import Signal (Signal, constant)

foreign import signalButton2 :: forall eff c.
                                (c -> Signal c)
                             -> Eff (dom :: DOM | eff) (Signal String)

foreign import signalLink :: forall eff c.
                             (c -> Signal c)
                          -> Eff (dom :: DOM | eff) (Signal String)

foreign import displayBoxValue :: forall eff.
                                  String
                               -> Eff (dom :: DOM | eff) Unit

button2 :: forall eff. Eff (dom :: DOM | eff) (Signal String)
button2 = signalButton2 constant

link :: forall eff. Eff (dom :: DOM | eff) (Signal String)
link = signalLink constant
