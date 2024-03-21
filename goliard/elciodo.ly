\version "2.24.3"
\header {
  title = "El ciodo"
}

global = {
  \key d \minor
  \language "english"
  \time 3/4
  \partial 4
  \set Timing.beamExceptions = #'()
  \set Timing.beatStructure = 1,1,1
}

Soprano = \relative {
  c' | f f8 g a f |
  g4 g8 a bf g | e e e e d e |
  f f f4 c4 | f f8 g a f |
  g4 g8 a bf g | e e e e d e |
  f4 r c
}
SopranoLyrics = \lyricmode {
  El |
  cio -- do del fe -- ro | ve -- cio de la me -- |
  ca -- ni -- ca, de -- la -- me | ca -- ni -- ca, el |
  cio -- do del fe -- ro | ve -- cio de la me -- |
  ca -- ni -- ca de pre -- ci -- | sion el |
}
Alto = \relative {
  d''4 g, a e8 e | fs g a c d2
}
Tenore = \relative {
  d''4 g, a e8 e | fs g a c d2
}
Basso = \relative {
  \clef "bass"
  d'4 g, a e8 e | fs g a c d2
}

MyChoir = \new ChoirStaff <<
  \new Voice = "SopranoVoice" << \global \Soprano >>
  \new Lyrics \lyricsto "SopranoVoice" \SopranoLyrics
  \new Voice = "AltoVoice" << \global \Alto >>
  \new Lyrics \lyricsto "AltoVoice" \SopranoLyrics
  \new Voice = "TenoreVoice" << \global \Tenore >>
  \new Lyrics \lyricsto "TenoreVoice" \SopranoLyrics
  \new Voice = "BassoVoice" << \global \Basso >>
  \new Lyrics \lyricsto "BassoVoice" \SopranoLyrics
>>

\book {
  \score {
    \MyChoir
    \layout { }
  }
}
