module Scratch where

import Prelude

import Data.Foldable (oneOf)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (globalPortal1, guard, text_)
import Deku.Core (Domable, Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event)

data Square = TL | BL | TR | BR

derive instance Eq Square

moveSpriteHere
  :: forall lock payload
   . { iframe :: Domable lock payload
     , square :: Event Square
     , setSquare :: Square -> Effect Unit
     , at :: Square
     }
  -> Domable lock payload
moveSpriteHere { iframe, square, setSquare, at } = D.a
  ( oneOf
      [ click_ (setSquare at)
      , D.Class !:=
          "block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700"
      ]
  )
  [ D.h5
      ( D.Class !:=
          "cursor-pointer mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
      )
      [ text_ "Move sprite here"
      , guard (square <#> (_ == at)) iframe
      ]
  ]

myIframe :: Nut
myIframe = D.video
  ( oneOf
      [ D.Width !:= "175"
      , D.Height !:= "175"
      , D.Autoplay !:= "true"
      , D.Loop !:= "true"
      , D.Muted !:= "true"
      ]
  )
  [ D.source (D.Src !:= "https://media.giphy.com/media/IMSq59ySKydYQ/giphy.mp4")
      []
  ]

main :: Effect Unit
main = runInBody Deku.do
  ifr <- globalPortal1 myIframe
  setSquare /\ square <- useState TL
  D.div (klass_ "grid grid-cols-2")
    [ moveSpriteHere { iframe: ifr, square, setSquare, at: TL }
    , moveSpriteHere { iframe: ifr, square, setSquare, at: TR }
    , moveSpriteHere { iframe: ifr, square, setSquare, at: BL }
    , moveSpriteHere { iframe: ifr, square, setSquare, at: BR }
    ]
