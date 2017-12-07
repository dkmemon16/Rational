!Rational methodsFor: 'internal methods' stamp: 'dkm 11/27/2017 01:22'!
gcd: x number2: y[
		|a b |
		a := x.
		b := y.
		[(b = 0) not] 
		whileTrue: [ |r|  
			r := a rem: y.
			a := b.
			b := r].
		^a
		]
		

simplify[
		|g|
		g:= self gcd: numerator number2: denominator.
		numerator := numerator/g.
		denominator := denominator/g.
 ]
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

setDenominator: newDenominator[
		denominator:= newDenominator
]

setDistance: newDistance[
	distance:= newDistance ]

setMass: newMass[
	mass := newMass ]

setNumerator: newNumerator[
	numerator:= newNumerator ]

setTime: newTime[
	time:=newTime ]
