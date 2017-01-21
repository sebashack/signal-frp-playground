module Validation (formInput, enableButton) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import DOM (DOM)
import Signal (Signal, constant)

foreign import signalFormInput :: forall eff c.
                                  (c -> Signal c)
                               -> Eff (dom :: DOM | eff) (Signal String)

foreign import enableButton :: forall eff.
                               Boolean
                            -> Eff (dom :: DOM | eff) Unit


formInput :: forall eff. Eff (dom :: DOM | eff) (Signal String)
formInput = signalFormInput constant
