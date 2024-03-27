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
  \new Staff <<
    \key bf \major
    \tempo 4 = 90
    \time 4/4
    \relative c'' {
      r2 d( | d4) g d c( | c) f c bf( | bf) a d fs, | g r r2 |
      <<
        {
          g1( | g4) e fs2 | bf1( | bf4) g a2 | ef'2\( d4\) r | ef2\( d4\) r | bf\( d c bf\) | bf2\( as4\) r |
          g1( | g4) e fs2 | bf1( | bf4) g a2 | ef'2\( d4\) r | ef2\( d4\) r | bf d g, a | a2\( g4\) r |
          bf2 bf4 r | bf2 bf4 r | bf8\( c d4 c bf( | bf) g a2\) | bf2 bf4 r | bf2 c4 r |
          d8\( c bf4 g bf | a4. bf8 bf4\) f | f g g a | f2. bf4( | bf) a2 c4 | r bf c d | ef1\( | ef2\) d4 d( | d) c2 bf4 | a2 r4
          d,4 | g2\( fs4\) d | bf2 a4
        } \\
        {
          bf,4 c d bf |
        }
      >> 
    }
  >>
  \new Staff <<
    \key bf \major
    \tempo 4 = 90
    \time 4/4
    \relative c' {
      d4( e fs a) | <g ef>2( <a f> | <f d> <g ef>) | <ef c>( <d bf>4 <c a> | <bf g>)
      \clef bass ef,( d bf) |
      g a bf g | d'1 | bf4 c d bf |
      s1*20
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
    \midi { }
  }
}
