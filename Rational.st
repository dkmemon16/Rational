Object subclass: #Rational
    instanceVariableNames: 'numerator denominator distance time mass'
	classVariableNames: 'defaultDistance defaultTime defaultMass defaultNumerator defaultDenominator'
	poolDictionaries: ' '
	category: 'dimmensional fraction '	!


!Rational class methodsFor: 'initialization' stamp: 'dkm 11/27/2017 01:52'!
intialize "set the dimmensions to 0"
	defaultDistance:= 0.
	defaultTime := 0.
	defaultMass := 0.
	defaultNumerator := 0.
	defaultDenominator := 1.
!!
!Rational class methodsFor: 'initialization' stamp: 'dkm 11/27/2017 01:52'!
new "creates a Rational with the dimmensions set to 0"
	^ super new init: defaultDistance time: defaultTime mass: defaultMass numerator: defaultNumerator denominator: defaultDenominator
! !

!Rational class methodsFor: 'initialization' stamp: 'dkm 11/27/2017 01:52'!
customRational: dist time: tm mass: ms numerator: num denominator: den
	^super new init: dist time: tm mass: ms numerator: num denominator: den
! !

!Rational methodsFor: 'initialize' stamp: 'dkm 11/27/2017 01:52'!
init: dist time: tm mass: ms numerator: num denominator: den
	"initialize a Rational"

		numerator := num.
		denominator:= den.
		distance := dist.
		time := tm.
		mass := ms.
!!
!Rational methodsFor: 'printing' !
printRational	
	numerator print .
	  '/' printString . 
	denominator print .
		! !

!Rational methodsFor: 'operation'!
add: aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass
	"add two rationals"
((aDistance = distance) & (aTime = time) & (aMass = mass)) 
		ifTrue: [
		| num den result |
		num := (numerator * aDenominator) + (denominator * aNumerator).
		den := denominator * aDenominator.
		result := self new num den distance time mass.
		"result simplify."
		^result
		]
		ifFalse:[
			self error: 'The rationals do not have equivalent dimmensions'
		].
! !

!Rational methodsFor: 'operation' stamp: 'dkm 11/27/2017 03:15'!
multiply:  aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass

	|newNum newDen newDist newTime newMass result|
	newNum:=  aNumerator* self numerator.
	newDen:= aDenominator* self denominator.
	newDist:= aDistance + self distance.
	newTime:= aTime + self time.
	newMass:= aMass -+ self mass.
	result:=(Rational new)num: newNum den: newDen dist: newDist tm: newTime ms: newMass.
	"result simplify."
	^result! !

!Rational methodsFor: 'operation' stamp: 'dkm 11/27/2017 03:15'!
divide:  aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass

	|newNum newDen newDist newTime newMass result|
	newNum:= aDenominator * self numerator.
	newDen:= aNumerator* self denominator.
	newDist:= aDistance - self distance.
	newTime:= aTime - self time.
	newMass:= aMass - self mass.
	result:=(Rational new)num: newNum den: newDen dist: newDist tm: newTime ms: newMass.
	"result simplify."
	^result! !

!Rational methodsFor: 'operation' stamp: 'dkm 11/27/2017 02:28'!
subtract: aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass
	"subtract two rationals"
((aDistance = distance) & (aTime = time) & (aMass = mass)) 
		ifTrue: [
		| num den result |
		num := (numerator * aDenominator) - (denominator * aNumerator).
		den := denominator * aDenominator.
		result := self new num den distance time mass.
		"result simplify."
		^result
		]
		ifFalse:[
			self error: 'The rationals do not have equivalent dimmensions'
		].! !

" tests"
|a|
	a := (Rational new) init num1: 1 num2: 2 num3: 3 num4: 4 num5: 5.
	(a printRational).
