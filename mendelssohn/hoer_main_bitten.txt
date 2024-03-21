\version "2.24.3"
\header {
  title = "Hymn: Hör mein Bitten"
  composer = "Felix Mendelssohn Bartholdy"
}

global = {
  \key g \major
  \language "english"
  \autoBeamOff
}

Soprano = \relative {
  d''4 g, a e8 e | fs g a c d2
}
SopranoLyrics = \lyricmode {
  Hör' mein Bit -- ten, Herr, | nei -- ge dich zu mir! |
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

SoloNotes = \relative {
  %\autoBeamOff
  r1 |
  r1 |
  r2 d''4 g, |
  a d,8 d e fs g b |
  %5
  d4. d8 d g, a c |
  c4 b4. e8[( c)] b |
  a4. r8 d4 g,4 |
  a d,8 d e fs g b |
  d4 r8 b8 b b e d |
  %10
  d4 cs r8 c4 a8 |
  d4. d8 g b, c cs |
  d4 d r8 a8[( c)] b |
  g4 r8 a bf8. d16 d4 |
  r8 d^\cresc g,\! a bf[( g)] bf d |
  \MyChoir  
}

SoloLyrics = \lyricmode {
  Hör' mein |
  Bit -- ten, Herr, nei -- ge dich zu |
  mir, auf dei -- nes Kin -- des |
  Stim -- me ha -- be |
  Acht! Hör' mein |
  Bit -- ten, Herr, nei -- ge dich zu |
  mir, auf dei -- nes Kin -- des |
  Stim -- me ha -- be |
  Acht, auf dei -- nes Kin -- des |
  Stim -- me ha -- be |
  Acht! Ich bin al -- lein; |
  wer wird mir Trö -- ster und |
}


\book {
  \score {
    <<
      \new Voice = "SoloVoice" << \global \SoloNotes >>
      \new Lyrics \lyricsto "SoloVoice" \SoloLyrics
    >>
    \layout { }
  }
}
