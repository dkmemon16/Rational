"Assignment 4 Danial Memon" 
"class Rational"
Object subclass: #Rational .
	Rational instanceVariableNames: 'numerator denominator distance time mass' .

Rational class extend [
	new: numerator number2: denominator d: distance t:  time m: mass[
		| d |
		d := self init: numerator denominator distance time mass.
		^d
	]

]

Rational extend[
	init: num number2: den unit1: dist unit2: tm unit3: ms[
		den = 0
		ifTrue: [self error: 'The number 0 cannot be in the denominator'].
		(num isKindOf: Integer)	ifFalse:[ self error: 'The number in the numerator must be an integer'].
		(den isKindof: Integer)
		ifFalse:[self error: 'The number in the denominator must be an integer'].
		
		numerator:= num.
		denominator := den.
		distance := dist.
		time := tm.
		mass := ms.
	]
]

Rational extend[
	add: aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass[
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
		].			
	]		

	
	
	printRational[
		<category: 'printing'>
		^(numerator printString), '/', (denominator printString)		
	]

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
		g:= self gcd number1: numerator number2: denominator.
		numerator := numerator/g.
		denominator := denominator/g.
	]
	"methods to access variables of Rational"
	getNumerator[
		^numerator
	]
	getDenominator[
		^denominator
	]

	getDistance[
		^distance
	]
	getTime[
		^time
	]
	getMass[
		^mass
	]
] !


" tests"
|a|
a := (Rational new) init: 1 num2: 2 num3: 3 num4: 4 num5: 5.
(a printRational).
