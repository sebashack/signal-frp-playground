module Accumulator ( addButton
                   , subtractButton
                   , displayAccumValue ) where
import Prelude (Unit)
import Control.Monad.Eff (Eff)
import DOM (DOM)
import Signal (Signal, constant)

foreign import signalAddButton :: forall eff c.
                                  (c -> Signal c)
                               -> Eff (dom :: DOM | eff) (Signal Int)


foreign import signalSubtractButton :: forall eff c.
                                       (c -> Signal c)
                                    -> Eff (dom :: DOM | eff) (Signal Int)

foreign import displayAccumValue :: forall eff.
                                    Int
                                 -> Eff (dom :: DOM | eff) Unit

addButton :: forall eff. Eff (dom :: DOM | eff) (Signal Int)
addButton = signalAddButton constant

subtractButton :: forall eff. Eff (dom :: DOM | eff) (Signal Int)
subtractButton = signalSubtractButton constant
