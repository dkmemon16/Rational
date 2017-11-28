" defining a new class: Stack "

	Object subclass: #Stack .
	Stack instanceVariableNames: 'count elements' .
	Stack class instanceVariableNames: 'maxDepth' .
	Stack comment: 'I represent a stack' .

	Stack class extend [
		initialize [ " sets default depth "
			maxDepth := 100
		]
		new [ "builds a new stack of default depth"
			(maxDepth = nil) ifTrue: [self initialize] . " Sarah Vessels"
			^ super new init: maxDepth
		]
		new: desiredDepth [ "builds new stack of given depth"
			^ super new init: desiredDepth
		]
	]

	Stack extend [
		init: depth [
			count := 0.
			elements := Array new: depth
		]
	]
	Stack extend [
		foo: f bar: b [
			^ (f + b)
		]
		empty [
			^ count = 0 .
		]
		push: elem [
			elements size <= count
			ifTrue: [self error: 'Stack overflow']
			ifFalse: [
				count := count + 1.
				elements at: count put: elem .
				] .
		]
		pop [ |top|
			self empty
			ifTrue: [self error: 'Stack is empty']
			ifFalse: [
				top := elements at: count.
				count := count - 1.
				^ top
			]
		]
	] !
	
	" initial tests "

	" I could do this here: Stack initialize"
	|aStack|
		aStack := (Stack new) init: 2.
		aStack empty printNl .
		(aStack push: 3) empty printNl .
		(aStack push: 4) .
		(aStack pop) printNl .
	! 
