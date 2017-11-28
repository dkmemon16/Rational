'From Squeak5.1 of 5 September 2016 [latest update: #16549] on 21 November 2017 at 10:34:05 am'!
Object subclass: #Rational
	instanceVariableNames: 'numerator denominator distance time mass'
	classVariableNames: 'defaultDistance defaultTime defaultMass defaultNumerator defaultDenominator'
	poolDictionaries: ''
	category: 'UserObjects'!

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


!Rational methodsFor: 'accesors' stamp: 'dkm 11/27/2017 01:24'!
getDenominator
		^denominator! !

!Rational methodsFor: 'accesors' stamp: 'dkm 11/27/2017 01:25'!
getDistance
^distance! !

!Rational methodsFor: 'accesors' stamp: 'dkm 11/27/2017 01:29'!
getMass
	^mass! !

!Rational methodsFor: 'accesors' stamp: 'dkm 11/27/2017 01:28'!
getNumerator
^numerator! !

!Rational methodsFor: 'accesors' stamp: 'dkm 11/27/2017 01:29'!
getTime
	^time! !

!Rational methodsFor: 'mutators' stamp: 'dkm 11/27/2017 01:24'!
setDenominator: newDenominator
		denominator:=newDenominator
! !

!Rational methodsFor: 'mutators' stamp: 'dkm 11/27/2017 01:25'!
setDistance: newDistance
	distance:= newDistance! !

!Rational methodsFor: 'mutators' stamp: 'dkm 11/27/2017 01:29'!
setMass: newMass
	mass := newMass! !

!Rational methodsFor: 'mutators' stamp: 'dkm 11/27/2017 01:28'!
setNumerator: newNumerator
	numerator:= newNumerator! !

!Rational methodsFor: 'mutators' stamp: 'dkm 11/27/2017 01:29'!
setTime: newTime
	time:=newTime! !


!Rational methodsFor: 'printing' stamp: 'dkm 11/27/2017 01:30'!
printRational
		^(numerator printString), '/', (denominator printString)	! !


!Rational methodsFor: 'operation' stamp: 'dkm 11/27/2017 01:32'!
add: aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass
	"add two rationals"
((aDistance = distance) & (aTime = time) & (aMass = mass)) 
		ifTrue: [
		| num den result |
		num := (numerator * aDenominator) + (denominator * aNumerator).
		den := denominator * aDenominator.
		result := self new num den distance time mass.
		result simplify.
		^result
		]
		ifFalse:[
			self error: 'The rationals do not have equivalent dimmensions'
		].! !

!Rational methodsFor: 'operation' stamp: 'dkm 11/27/2017 03:15'!
multiply:  aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass

	|newNum newDen newDist newTime newMass result|
	newNum:=  aNumerator* self numerator.
	newDen:= aDenominator* self denominator.
	newDist:= aDistance + self distance.
	newTime:= aTime + self time.
	newMass:= aMass -+ self mass.
	result:=(Rational new)num: newNum den: newDen dist: newDist tm: newTime ms: newMass.
	result simplify.
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
	result simplify.
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
		result simplify.
		^result
		]
		ifFalse:[
			self error: 'The rationals do not have equivalent dimmensions'
		].! !


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
init: dist time: tm mass: ms numerator: num denominator: den]
	"initialize a Rational"
		den = 0
		ifTrue: [self error: 'The number 0 cannot be in the denominator'].
		(num isKindOf: Integer)	ifFalse:[ self error: 'The number in the numerator must be an integer'].
		(den isKindOf: Integer)
		ifFalse:[self error: 'The number in the denominator must be an integer'].
		
		numerator := num.
		denominator:= den.
		distance := dist.
		time := tm.
		mass := ms.
!!

" tests"
|a|
	a := (Rational new) init: 1 num2: 2 num3: 3 num4: 4 num5: 5.
	(a printRational).
!
