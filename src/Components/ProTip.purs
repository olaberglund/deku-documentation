module Components.ProTip where


import Deku.Attribute ((!:=))
import Deku.Core (Nut)
import Deku.DOM as D

proTip
  :: { header :: Nut, message :: Nut }
  -> Nut
proTip { header, message } = D.div
  [D.Class !:=
      "my-8 flex rounded-3xl p-6 bg-sky-50 dark:bg-slate-800/60 dark:ring-1 dark:ring-slate-300/10"
  ]
  [ D.svg
          [ D.AriaHidden !:= "true"
          , D.ViewBox !:= "0 0 32 32"
          , D.Fill !:= "none"
          , D.Class !:=
              "h-8 w-8 flex-none [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"
          ]
      [ D.defs_
          [ D.radialGradient
                  [ D.Cx !:= "0"
                  , D.Cy !:= "0"
                  , D.R !:= "1"
                  , D.GradientUnits !:= "userSpaceOnUse"
                  , D.Id !:= ":R516sm:-gradient"
                  , D.GradientTransform !:=
                      "matrix(0 21 -21 0 20 11)"
                  ]
              [ D.stop [D.StopColor !:= "#0EA5E9"] []
              , D.stop
                      [ D.StopColor !:= "#22D3EE"
                      , D.Offset !:= ".527"
                      ]
                  []
              , D.stop
                      [ D.StopColor !:= "#818CF8"
                      , D.Offset !:= "1"
                      ]
                  []
              ]
          , D.radialGradient
                  [ D.Cx !:= "0"
                  , D.Cy !:= "0"
                  , D.R !:= "1"
                  , D.GradientUnits !:= "userSpaceOnUse"
                  , D.Id !:= ":R516sm:-gradient-dark"
                  , D.GradientTransform !:=
                      "matrix(0 24.5001 -19.2498 0 16 5.5)"
                  ]
              [ D.stop [D.StopColor !:= "#0EA5E9"] []
              , D.stop
                      [ D.StopColor !:= "#22D3EE"
                      , D.Offset !:= ".527"
                      ]
                  []
              , D.stop
                      [ D.StopColor !:= "#818CF8"
                      , D.Offset !:= "1"
                      ]
                  []
              ]
          ]
      , D.g [D.Class !:= "dark:hidden"]
          [ D.circle
                  [ D.Cx !:= "20"
                  , D.Cy !:= "20"
                  , D.R !:= "12"
                  , D.Fill !:= "url(#:R516sm:-gradient)"
                  ]
              []
          , D.path
                  [ D.FillRule !:= "evenodd"
                  , D.ClipRule !:= "evenodd"
                  , D.D !:=
                      "M20 24.995c0-1.855 1.094-3.501 2.427-4.792C24.61 18.087 26 15.07 26 12.231 26 7.133 21.523 3 16 3S6 7.133 6 12.23c0 2.84 1.389 5.857 3.573 7.973C10.906 21.494 12 23.14 12 24.995V27a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-2.005Z"
                  , D.Class !:=
                      "fill-[var(--icon-background)]"
                  , D.FillOpacity !:= "0.5"
                  ]
              
              []
          , D.path
                  [ D.D !:=
                      "M25 12.23c0 2.536-1.254 5.303-3.269 7.255l1.391 1.436c2.354-2.28 3.878-5.547 3.878-8.69h-2ZM16 4c5.047 0 9 3.759 9 8.23h2C27 6.508 21.998 2 16 2v2Zm-9 8.23C7 7.76 10.953 4 16 4V2C10.002 2 5 6.507 5 12.23h2Zm3.269 7.255C8.254 17.533 7 14.766 7 12.23H5c0 3.143 1.523 6.41 3.877 8.69l1.392-1.436ZM13 27v-2.005h-2V27h2Zm1 1a1 1 0 0 1-1-1h-2a3 3 0 0 0 3 3v-2Zm4 0h-4v2h4v-2Zm1-1a1 1 0 0 1-1 1v2a3 3 0 0 0 3-3h-2Zm0-2.005V27h2v-2.005h-2ZM8.877 20.921C10.132 22.136 11 23.538 11 24.995h2c0-2.253-1.32-4.143-2.731-5.51L8.877 20.92Zm12.854-1.436C20.32 20.852 19 22.742 19 24.995h2c0-1.457.869-2.859 2.122-4.074l-1.391-1.436Z"
                  , D.Class !:=
                      "fill-[var(--icon-foreground)]"
                  ]
              
              []
          , D.path
                  [ D.D !:=
                      "M20 26a1 1 0 1 0 0-2v2Zm-8-2a1 1 0 1 0 0 2v-2Zm2 0h-2v2h2v-2Zm1 1V13.5h-2V25h2Zm-5-11.5v1h2v-1h-2Zm3.5 4.5h5v-2h-5v2Zm8.5-3.5v-1h-2v1h2ZM20 24h-2v2h2v-2Zm-2 0h-4v2h4v-2Zm-1-10.5V25h2V13.5h-2Zm2.5-2.5a2.5 2.5 0 0 0-2.5 2.5h2a.5.5 0 0 1 .5-.5v-2Zm2.5 2.5a2.5 2.5 0 0 0-2.5-2.5v2a.5.5 0 0 1 .5.5h2ZM18.5 18a3.5 3.5 0 0 0 3.5-3.5h-2a1.5 1.5 0 0 1-1.5 1.5v2ZM10 14.5a3.5 3.5 0 0 0 3.5 3.5v-2a1.5 1.5 0 0 1-1.5-1.5h-2Zm2.5-3.5a2.5 2.5 0 0 0-2.5 2.5h2a.5.5 0 0 1 .5-.5v-2Zm2.5 2.5a2.5 2.5 0 0 0-2.5-2.5v2a.5.5 0 0 1 .5.5h2Z"
                  , D.Class !:=
                      "fill-[var(--icon-foreground)]"
                  ]
              []
          ]
      , D.g [D.Class !:= "hidden dark:inline"]
          [ D.path
                  [ D.FillRule !:= "evenodd"
                  , D.ClipRule !:= "evenodd"
                  , D.D !:=
                      "M16 2C10.002 2 5 6.507 5 12.23c0 3.144 1.523 6.411 3.877 8.691.75.727 1.363 1.52 1.734 2.353.185.415.574.726 1.028.726H12a1 1 0 0 0 1-1v-4.5a.5.5 0 0 0-.5-.5A3.5 3.5 0 0 1 9 14.5V14a3 3 0 1 1 6 0v9a1 1 0 1 0 2 0v-9a3 3 0 1 1 6 0v.5a3.5 3.5 0 0 1-3.5 3.5.5.5 0 0 0-.5.5V23a1 1 0 0 0 1 1h.36c.455 0 .844-.311 1.03-.726.37-.833.982-1.626 1.732-2.353 2.354-2.28 3.878-5.547 3.878-8.69C27 6.507 21.998 2 16 2Zm5 25a1 1 0 0 0-1-1h-8a1 1 0 0 0-1 1 3 3 0 0 0 3 3h4a3 3 0 0 0 3-3Zm-8-13v1.5a.5.5 0 0 1-.5.5 1.5 1.5 0 0 1-1.5-1.5V14a1 1 0 1 1 2 0Zm6.5 2a.5.5 0 0 1-.5-.5V14a1 1 0 1 1 2 0v.5a1.5 1.5 0 0 1-1.5 1.5Z"
                  , D.Fill !:=
                      "url(#:R516sm:-gradient-dark)"
                  ]
              []
          ]
      ]
  , D.div [D.Class !:= "ml-4 flex-auto"]
      [ D.p
          [D.Class !:=
              "m-0 font-display text-xl text-sky-900 dark:text-sky-400"
          ]
          [ header ]
      , D.div
          [D.Class !:=
              "prose mt-2.5 text-sky-800 [--tw-prose-background:theme(colors.sky.50)] prose-a:text-sky-900 prose-code:text-sky-900 dark:text-slate-300 dark:prose-code:text-slate-300"
          ]
          [ message ]
      ]
  ]