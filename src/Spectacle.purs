module Spectacle where

import Pux.Html (Html, Attribute)

type Component = forall a. Array (Attribute a) -> Array (Html a) -> Html a

foreign import spectacle :: Component

foreign import deck :: Component

foreign import slide :: Component

foreign import appear :: Component

foreign import blockQuote :: Component

foreign import quote :: Component

foreign import cite :: Component

foreign import codePane :: Component

foreign import fill :: Component

foreign import heading :: Component

foreign import image :: Component

foreign import layout :: Component

foreign import link :: Component

foreign import listItem :: Component

foreign import list :: Component

foreign import markdown :: Component

foreign import textS :: Component
