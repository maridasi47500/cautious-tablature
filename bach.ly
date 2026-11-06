\version "2.16.0"
\language "netherlands"

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
  
  \voices 1, 2 
   <<  % Voice one
  
   { r2 c } 
   \\  % Voice = "2"
   {  e,4 f8 g a2\3 }
   >> 
    \voices 1, 2 
   <<  % Voice one
  
   { e'4\2 d8 c b4 cis } 
   \\  % Voice = "2"
   {  gis2 g }
   >> 
 }
 
 violin_chorus_judas_maccabaeus = \addViolinTab{\key c \major \time 4/4 \melody_chorus_judas_maccabaeus}
 
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