module Pages.FRP.Behaviors.Definition.BehaviorsVersusFlapping where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Functor (mapFlipped)
import Deku.Control (text, text_)
import Deku.DOM as D
import Effect.Random (random)
import FRP.Behavior (behavior, sample)
import FRP.Event.Effect (bindToEffect)
import FRP.Event.Time (interval)

behaviorsVersusFlapping :: forall lock payload. Subsection lock payload
behaviorsVersusFlapping = subsection
  { title: "A Behavior in the wild"
  , matter: pure
      [ D.p_
          [ text_
              "Let's see a behavior in the wild. Our behavior will observe a random phenomenon, and we'll consult it on a regular interval."
          ]
      , psCode
          """module Main where

import Prelude

import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Data.Functor (mapFlipped)
import Effect.Random (random)
import FRP.Behavior (behavior, sample)
import FRP.Event.Effect (bindToEffect)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  text
    ( show <$> sample
        (behavior (flip bindToEffect (mapFlipped random)))
        (interval 250 $> add 42.0)
    )
"""
      , exampleBlockquote
          [ text
              ( show <$> sample
                  (behavior (flip bindToEffect (mapFlipped random)))
                  (interval 250 $> add 42.0)
              )
          ]
      , D.p_
          [ text_ "The "
          , D.code__ "sample"
          , text_ " function samples a behavior on an event, and the "
          , D.code__ "behavior"
          , text_ " function constructs a "
          , D.code__ "Behavior a"
          , text_ " from a term of type "
          , D.code__ "forall b. Event (a -> b) -> Event a"
          , text_ "."
          ]
      ]
  }
