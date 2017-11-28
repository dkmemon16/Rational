!Rational methodsFor: 'internal methods' stamp: 'dkm 11/27/2017 01:22'!
gcd: x number2: y
		|a b |
		a := x.
		b := y.
		[(b = 0) not] 
		whileTrue: [ |r|  
			r := a rem: y.
			a := b.
			b := r].
		^a! !

!Rational methodsFor: 'internal methods' stamp: 'dkm 11/27/2017 01:23'!
simplify
		|g|
		g:= self gcd: numerator number2: denominator.
		numerator := numerator/g.
		denominator := denominator/g.! !
 
!Rational methodsFor: 'accesors'!
getDenominator
	^ denominator  !
getDistance 
	^ distance !

getMass
	^ mass !

getNumerator
	^ numerator !

getTime
	^ time ! !

!Rational methodsFor: 'mutators'!
setDenominator: newDenominator
		denominator:= newDenominator
! !

!Rational methodsFor: 'mutators'!
setDistance: newDistance
	distance:= newDistance ! !

!Rational methodsFor: 'mutators'!
setMass: newMass
	mass := newMass ! !

!Rational methodsFor: 'mutators'!
setNumerator: newNumerator
	numerator:= newNumerator ! !

!Rational methodsFor: 'mutators'!
setTime: newTime
	time:=newTime ! !

