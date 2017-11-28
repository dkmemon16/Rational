
"define a new class to demonstrate syntax; could use 'extend' instead. "
Object subclass: #Foobar
	instanceVariableNames: 'widget'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Experimental' !

!Foobar methodsFor: 'accessing'!
gimme
	"tell value of widget"
	^ widget !

take: what
	"put new value in widget"
	widget := what .
	^ self !

printOn
	'what?  print a Foobar?' printNl .
	^ self  ! !

"a test of Foobars"
| f |
	f := Foobar new . f take: 3 . f gimme printNl . f printOn .
	f := ((Foobar new) take:3) gimme printNl .
