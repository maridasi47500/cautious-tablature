\version "2.16.0"
\language "english"

addViolinTab = #(define-music-function (parser location melody) (ly:music?)
  #{ <<
	\new Voice \with {
		\omit StringNumber
	} {
		\clef "treble"
		#melody
	}
	\new TabStaff \with {
		stringTunings = #violin-tuning
		tablatureFormat = #fret-letter-tablature-format
		fretLabels = #'("0" "1b" "1" "2b" "2" "3" "3#" "4" "4#")
	} {
		#melody
	}
	  >>
  #}
)

melody_chorus_judas_maccabaeus = \relative c'' {
  d2 \downbow \f b4.( c8) | d2 g,2 | a8( b c d) c4--( b--) | a2. r4 |
  b8( \downbow c d \set stringTunings = \stringTuning <g, d a' f''> e-4) \set stringTunings = #violin-tuning d4--( d--) | g2 d | c4 b a4.( g8) | g2. r4 |
  b8 \mf(\downbow a b c) b4--( b--) | a2 g | c4 b a g | fs2. r4 |
  \set stringTunings = \stringTuning <g, d a' f''> e'8-4(\downbow \set stringTunings = #violin-tuning ds e fs) e4--( fs--) | g2 e | fs4 e8\2-4 d cs4.( d8) | d2. r4 |
  d2 \downbow b4.( c8) | d2 g, | a8( b c d) c4--( b--) | a2. r4 |
  b8( \downbow c d e\2) d4--( d--) | g2 d | c4 b a4.\3( g8) | g2. r4
 }
 
 violin_chorus_judas_maccabaeus = \addViolinTab{\key g \major \time 4/4 \melody_chorus_judas_maccabaeus}
 
 \book {
  \paper {
	print-all-headers = ##t
  }
  \header {
	tagline = ""
  }
  \score {
	  \violin_chorus_judas_maccabaeus
	  \layout {}
  }
}