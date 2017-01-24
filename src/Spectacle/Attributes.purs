module Spectacle.Attributes where

import Data.Foreign (Foreign)
import Data.Newtype (unwrap)
import Data.Time.Duration (Milliseconds)
import Prelude (map, (<<<))
import Pux.Html (Attribute)
import Pux.Html.Attributes (attr)

-- | Spectacle attributes
type Theme =
  { colors ::
    { primary :: String
    , secondary  :: String
    , tertiary  :: String
    , quartenary  :: String }
  , fonts ::
    { primary :: String
    , secondary  :: String
    , tertiary  :: String } }

theme :: forall a. Theme -> Attribute a
theme = attr "theme" <<< createTheme

foreign import createTheme :: Theme -> Foreign

-- | Deck attributes
data Progress
  = Pacman
  | Bar
  | Number
  | None

progress :: forall a. Progress -> Attribute a
progress = attr "progress" <<< toString
  where
    toString Pacman = "pacman"
    toString Bar = "bar"
    toString Number = "number"
    toString None = "none"

preload :: forall a b. {| b } -> Attribute a
preload = attr "preload"

-- | Base attributes
data Transition
  = Slide
  | Zoom
  | Fade
  | Spin

transition :: forall a. Array Transition -> Attribute a
transition = attr "transition" <<< map toString
  where
    toString Slide = "slide"
    toString Zoom = "zoom"
    toString Fade = "fade"
    toString Spin = "spin"

transitionDuration :: forall a. Milliseconds -> Attribute a
transitionDuration = attr "transitionDuration" <<< unwrap

showControls :: forall a. Attribute a
showControls = attr "controls" true

italic :: forall a. Attribute a
italic = attr "italic" true

bold :: forall a. Attribute a
bold = attr "bold" true

caps :: forall a. Attribute a
caps = attr "caps" true

margin :: forall a. String -> Attribute a
margin = attr "margin"

padding :: forall a. String -> Attribute a
padding	= attr "padding"

textColor :: forall a. String -> Attribute a
textColor = attr "textColor"

textSize :: forall a. String -> Attribute a
textSize = attr "textSize"

textAlign	:: forall a. String -> Attribute a
textAlign	= attr "textAlign"

textFont :: forall a. String -> Attribute a
textFont = attr "textFont"

bgColor :: forall a. String -> Attribute a
bgColor = attr "bgColor"

bgImage :: forall a. String -> Attribute a
bgImage = attr "bgImage"

bgDarken :: forall a. Number -> Attribute a
bgDarken = attr "bgDarken"

-- | Slide attributes
align :: forall a. String -> Attribute a
align = attr "align"

notes :: forall a. String -> Attribute a
notes = attr "notes"

id :: forall a. String -> Attribute a
id = attr "id"

-- | Code-like attributes
source :: forall a. String -> Attribute a
source = attr "source"

-- | Markdown attributes
mdastConfig :: forall a. Foreign -> Attribute a
mdastConfig = attr "mdastConfig"

-- | CodePane attributes
lang :: forall a. String -> Attribute a
lang = attr "lang"

-- | Text-like attributes
fit :: forall a. Attribute a
fit = attr "fit" true

lineHeight :: forall a. String -> Attribute a
lineHeight = attr "lineHeight"

-- | Image attributes
src :: forall a. String -> Attribute a
src = attr "src"

display :: forall a. String -> Attribute a
display = attr "display"

height :: forall a. String -> Attribute a
height = attr "height"

width :: forall a. String -> Attribute a
width = attr "width"

-- | Link attributes
href :: forall a. String -> Attribute a
href = attr "href"

-- | S (text style) attributes
data Style
 = Strikethrough
 | Underline
 | Bold
 | Italic

textStyle :: forall a. Style -> Attribute a
textStyle = attr "style" <<< toString
  where
    toString Strikethrough = "strikethrough"
    toString Underline = "underline"
    toString Bold = "bold"
    toString Italic = "italic"
