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
  c'4 |
  \repeat volta 2 {
    f f8 g a f | g4 g8 a bf g |
    e e e e d e | f f f4 \breathe c4 |
    f f8 g a f | g4 g8 a bf g |
    e e e e d e |
    \alternative {
      { f4 r c }
      { \partial 2 f4 r }
    }
  }
}
SopranoLyrics = \lyricmode {
  El |
  cio -- do del fe -- ro | ve -- cio de la me -- |
  ca -- ni -- ca, de -- la -- me | ca -- ni -- ca, el |
  cio -- do del fe -- ro | ve -- cio de la me -- |
  ca -- ni -- ca de pre -- ci -- |
  \alternative {
    \volta 1 { sion el }
    \volta 2 { sion }
  }
}
Alto = \relative {
  c''4 |
  \repeat volta 2 {
    a a8 a a a | bf bf bf bf bf bf |
    c c c c c c | a a a4 \breathe c |
    a a8 a a a | bf bf bf bf bf bf |
    c c c c c c |
    \alternative {
      { a4 r c }
      { \partial 2 a4 r }
    }
  }
}
AltoLyrics = \lyricmode {}
Tenore = \relative {
  \clef "bass"
  r4 |
  \repeat volta 2 {
    c'2. | c |
    c | c |
    c | c |
    c |
    \alternative {
      { c }
      { \partial 2 c4 r }
    }
  }
}
TenoreLyrics = \lyricmode {}
Basso = \relative {
  \clef "bass"
  r4 |
  \repeat volta 2 {
    f8 f f4 f | c8 c c4 c |
    c c c | f f8 f f f |
    f f f4 f | c8 c c4 c |
    c c c | 
    \alternative {
      { f8 f f f f f }
      { \partial 2 f8 f f4 }
    }
  }
}
BassoLyrics = \lyricmode {}

MyChoir = \new ChoirStaff <<
  \new Voice = "SopranoVoice" << \global \Soprano >>
  \new Lyrics \lyricsto "SopranoVoice" \SopranoLyrics
  \new Voice = "AltoVoice" << \global \Alto >>
  \new Lyrics \lyricsto "AltoVoice" \AltoLyrics
  \new Voice = "TenoreVoice" << \global \Tenore >>
  \new Lyrics \lyricsto "TenoreVoice" \TenoreLyrics
  \new Voice = "BassoVoice" << \global \Basso >>
  \new Lyrics \lyricsto "BassoVoice" \BassoLyrics
>>

\book {
  \score {
    \MyChoir
    \layout { }
  }
}
