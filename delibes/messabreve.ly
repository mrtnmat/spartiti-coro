\version "2.24.3"
\language "english"

KyrieChoir = \new ChoirStaff <<
  \new Voice = "Soprano 1" \relative c'' {
    r1 | r | r | r | r |
    r | r | bf4. bf8 bf4 bf | c4. c8 c4 r |
  }
  \new Voice = "Soprano 2" \relative c'' {
    r1 | r | r | r | r |
    g4. g8 g4 g | a4. a8 a4 r4 | r1 | r |
  }
>>

firstVoice = \relative c'' {
  \key bf \major
  \tempo 4 = 90
  \time 4/4
  r2 d2~ | 4 g4 d4 c4~ | 4 f4 c4 bf4~ | 4 a4 d4 fs,4 | g4 r4 r2 |
  g1~ | 4 e4 fs2 | bf1~ | 4 g4 a2 |
  ef'2( d4) r4 | ef2( d4) r4 |
  bf4( d4 c4 bf4) | bf2( a4) r4 |
  g1~ | 4 e4 fs2 | bf1~ | 4 g4 a2 |
  ef'2( d4) r4 | ef2( d4) r4 |
  %bf4( d4 c4 bf4) | bf2( a4) r4 |
  bf4 d4 g,4 a4 | a2 g4 r4 |
  bf2 4 r4 | bf2 4 r4 |
  bf8( c8 d4 c4 bf4~ | 4 g4 a2) |
  bf2 4 r4 | bf2 c4 r4 |
}
secondVoice = \relative c'' {
  \key bf \major
  \tempo 4 = 90
  \time 4/4
  r2 s2 | r1*4 |
  bf,4 c4 d4 bf4 | c2. d4~ | 4 ef4 f4 d4 | c2. f4 |
  g2 fs4 r4 | g2 fs4 r4 |
  g4 bf4 a4 g4 | g2 fs4 r4 |
  bf,4 c4 d4 g,4 | a2. d4~ | 4 ef4 f4 bf,4 | c2. f4 |
  g2 fs4 r4 | g2 fs4 r4 |
  %g4 bf4 a4 g4 | g2 fs4 r4 |
  g1( | \once \stemUp fs2 \once \stemUp g4 ) r4 |
  f2 g4 r4 | f2 g4 r4 |
  f2 e2 | f1 |
  f2 g4 r4 | f2 4 r4 |
}

KyrieOrchestra = \new PianoStaff \with { instrumentName = "Piano" }
<<
  \new Staff \with {
    \consists Merge_rests_engraver
    printPartCombineTexts = ##f
  }
  \partCombine \firstVoice \secondVoice
  \new Staff {
    \key bf \major
    \tempo 4 = 90
    \time 4/4
    \relative c' {
      %d4( e fs a) | <g ef>2( <a f> | <f d> <g ef>) | <ef c>( <d bf>4 <c a> | <bf g>)
      %\clef bass ef,( d bf) |
      %g a bf g | d'1 | bf4 c d bf |
      s1*40
    }
  }
>>

  \paper {
    print-all-headers = ##t
  }
  \header {
    title = "Messa Breve"
  }
\book {
  \score {
    \header {
      title = "I. Kyrie"
      composer = "Léo Delibes"
    }
    <<
      %\KyrieChoir
      \KyrieOrchestra
    >>
    \layout { }
  }
  \score {
    \unfoldRepeats
    <<
      %\KyrieChoir
      \KyrieOrchestra
    >>
    \midi {
      \context {
            \Score
            midiChannelMapping = #'voice
          } 
    }
  }
}
