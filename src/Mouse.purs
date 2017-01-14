module Mouse (displayText, mousePosDisplay) where

import Prelude (Unit, bind, pure, show, (<>))
import Control.Monad.Eff (Eff)
import DOM (DOM)
import Signal (Signal, (~>))
import Signal.DOM (mousePos)

foreign import displayText :: forall eff. String
                                       -> Eff (dom :: DOM | eff) Unit

mousePosDisplay :: forall eff. Eff (dom :: DOM | eff) (Signal String)
mousePosDisplay = do
  sig <- mousePos
  pure (sig ~> toStr)
  where
    toStr { x, y } = "( " <> (show x) <> " " <> (show y) <> " )"
