module Pages.CoreConcepts.MoreHooks.UseMailboxed.MailboxesAsFilters where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Control.Alt ((<|>))
import Data.Array ((..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMailboxed, useState)
import Deku.Listeners (click)
import Examples as Examples
import QualifiedDo.Alt as Alt

mailboxesAsFilters :: forall lock payload. Subsection lock payload
mailboxesAsFilters = subsection
  { title: "Hello mailbox"
  , matter: pure
      [ D.p_
          [ text_ "A mailbox is similar to the "
          , D.code__ "useState'"
          , text_
              " hook. However, the left and right side of the returned value are different."
          ]
      , D.ol_
          [ D.li_
              [ text_
                  "On the left, we have a pusher that takes a record of type "
              , D.code__ "{ address :: a, payload :: b }"
              , text_ "."
              ]
          , D.li_
              [ text_
                  "On the right, we have an event creator that takes a value of type "
              , D.code__ "a"
              , text_ " and produces an event of type "
              , D.code__ "Event b"
              , text_ "."
              ]
          ]
      , D.p_
          [ text_ "Then, when used, the mailbox delivers payloads of type "
          , D.code__ "b"
          , text_ " "
          , D.i__ "only to"
          , text_
              " events that have been created with by invoking the function with the same term of type "
          , D.code__ "a"
          , text_ " as was received for the "
          , D.code__ "address"
          , text_ ". You can see an example below."
          ]
      , psCodeWithLink Examples.UseMailboxed
      , exampleBlockquote
          [ Deku.do
              setInt /\ int <- useState 0
              setMailbox /\ mailbox <- useMailboxed
              D.div_
                [ D.a
                    Alt.do
                      klass_ "cursor-pointer"
                      click $ int <#> \i -> do
                        setMailbox { address: i, payload: unit }
                        setInt ((i + 1) `mod` 100)
                    [ text_ "Bang!" ]
                , D.div_
                    ( (0 .. 99) <#> \n -> D.span
                        ( klass $ (pure false <|> (mailbox n $> true)) <#>
                            if _ then "" else "hidden"
                        )
                        [ text_
                            ( ( if n == 99 then "We're done here"
                                else show n
                              ) <> " "
                            )
                        ]
                    )
                ]
          ]

      ]
  }
