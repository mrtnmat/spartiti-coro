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

KyrieOrchestra = \new PianoStaff <<
  \new Staff {
    \key bf \major
    \tempo 4 = 90
    \time 4/4
    \relative c'' {
      r2 d2( | d4) g4 d4 c4( | c4) f4 c4 bf4( | bf4) a4 d4 fs,4 | g4 r4 r2 |
      <<
        { g1( | g4) e4 fs2 | bf1( | bf4) g4 a2 | } \\
        { bf,4 c4 d4 bf4 | c2. d4( | d4) ef4 f4 d4 | }
      >> 
      <g ef'>2\( <fs d'>4\) r4 | <g ef'>2\( <fs d'>4\) r4 |
      <g bf>4\( <bf d>4 <a c>4 <g bf>4\) | <g bf>2\( <fs a>4\) r4 | 
      <<
        { g1( | g4) e4 fs2 | bf1( | bf4) g4 a2 | } \\
        { bf,4 c4 d4 g,4 | a2. d4( | d4) ef4 f4 bf,4 | c2. f4 | }
      >> 
    }
  }
  \new Staff <<
    \key bf \major
    \tempo 4 = 90
    \time 4/4
    \relative c' {
      %d4( e fs a) | <g ef>2( <a f> | <f d> <g ef>) | <ef c>( <d bf>4 <c a> | <bf g>)
      %\clef bass ef,( d bf) |
      %g a bf g | d'1 | bf4 c d bf |
      s1*10
    }
  >>
>>

\book {
  \paper {
    print-all-headers = ##t
  }
  \header {
    title = "Messa Breve"
  }
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
