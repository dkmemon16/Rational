"Rational class"
Object subclass: #Rational
    instanceVariableNames: 'numerator denominator distance time mass'
	classVariableNames: 'defaultDistance defaultTime defaultMass defaultNumerator defaultDenominator'
	poolDictionaries: ' '
	category: 'dimmensional fraction '	!


!Rational class methodsFor: 'initialization'!
intialize "set the dimmensions to 0"
	defaultDistance:= 0.
	defaultTime := 0.
	defaultMass := 0.
	defaultNumerator := 0.
	defaultDenominator := 1.
!!
!Rational class methodsFor: 'initialization'!
new "creates a Rational with the dimmensions set to 0"
	^ super new init: defaultDistance time: defaultTime mass: defaultMass numerator: defaultNumerator denominator: defaultDenominator
! !

!Rational class methodsFor: 'initialization'!
customRational: dist time: tm mass: ms numerator: num denominator: den
	^super new init: dist time: tm mass: ms numerator: num denominator: den
! !

!Rational methodsFor: 'initialize'!
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

!Rational methodsFor: 'operation'!
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

!Rational methodsFor: 'operation'!
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

!Rational methodsFor: 'operation'!
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
	a := (Rational init)  num1: 1 num2: 2 num3: 3 num4: 4 num5: 5.
	(a printRational).
