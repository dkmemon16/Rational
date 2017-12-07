Object subclass: #Rational .
    Rational instanceVariableNames: 'numerator denominator distance time mass' .
    Rational class instanceVariableNames: 'defaultDistance defaultTime defaultMass defaultNumerator defaultDenominator' .

Rational class extend[
	intialize ["set the dimmensions to 0"
		defaultDistance := 0.
		defaultTime := 0.
		defaultMass := 0.
		defaultNumerator := 0.
		defaultDenominator := 1.
	]
	new ["creates a Rational with the dimmensions set to 0"
		^ super new init: defaultDistance 
	]

	new: number[
		^ self new init: number
	]
]


Rational extend[
	init: number[
		"initialize a Rational"

			numerator := number.
			denominator:= number.
			distance := number.
			time := number.
			mass := number.
	]
	getNumerator[
		^numerator
	]
	
	getDenominator[
		^denominator
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
		g:= self gcd: numerator number2: denominator.
		numerator := numerator/g.
		denominator := denominator/g.
 ]
 add: aRational[
	|a b|
	a := (aRational getNumerator).
	b := (aRational getDenominator).
	^self add: a num2: b num3: a num4: a num5: a
 
 ]	
	printRational[	
		self getNumerator print. 
		 '/' print . 
		self getDenominator printNl .
	]
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
	add: aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass[
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
	]

	multiply:  aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass[
		|newNum newDen newDist newTime newMass result|
		newNum:=  aNumerator* self numerator.
		newDen:= aDenominator* self denominator.
		newDist:= aDistance + self distance.
		newTime:= aTime + self time.
		newMass:= aMass -+ self mass.
		result:=(Rational new)num: newNum den: newDen dist: newDist tm: newTime ms: newMass.
		"result simplify."
		^result
	]

	divide:  aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass[
		|newNum newDen newDist newTime newMass result|
		newNum:= aDenominator * self numerator.
		newDen:= aNumerator* self denominator.
		newDist:= aDistance - self distance.
		newTime:= aTime - self time.
		newMass:= aMass - self mass.
		result:=(Rational new)num: newNum den: newDen dist: newDist tm: newTime ms: newMass.
		"result simplify."
		^result
	]

	subtract: aNumerator den: aDenominator dist: aDistance tm: aTime ms: aMass[
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
			].
	]
]!
" tests"
|a b|
	a := (Rational new) init: 1.
	a setNumerator: 2.
	a setDenominator: 3.
	(a printRational).
	b:= (Rational new) init: 1.
	b:= (a add: a).
	(b printRational)
	
!
