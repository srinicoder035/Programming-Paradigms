Object subclass: #SymbolicExpression
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Differentiation'!

!SymbolicExpression methodsFor: 'arithmetic operations' stamp: 'AB 11/10/2006 22:06'!
adaptToNumber: rcvr andSend: selector
	"a number is trying to do an arithmetic operation with this object.  Return the
		appropriate symbolic expression"
	selector = #+ ifTrue: [^Addition exp1: rcvr exp2: self].
	selector = #* ifTrue: [^Multiplication exp1: rcvr exp2: self].	
	self error: 'unknown selector'
! !

!SymbolicExpression methodsFor: 'arithmetic operations' stamp: 'ab 11/11/2005 21:20'!
* x
	^Multiplication exp1: self exp2: x
! !

!SymbolicExpression methodsFor: 'arithmetic operations' stamp: 'ab 11/11/2005 21:20'!
+ x
	^Addition exp1:  self exp2: x
! !


!SymbolicExpression methodsFor: 'derivatives' stamp: 'AB 11/10/2006 22:13'!
deriv: x
	"find the derivative of this expression with respect to x"
	self subclassResponsibility! !


!SymbolicExpression methodsFor: 'evaluation' stamp: 'AB 11/10/2006 22:14'!
evaluate: dict
	"evaluate this expression in the context given by dict"
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

SymbolicExpression class
	instanceVariableNames: ''!

!SymbolicExpression class methodsFor: 'tests' stamp: 'AB 11/10/2006 20:32'!
test1
	"SymbolicExpression test1"
		| x y e1 e2 e3 |
	x := SymbolicVariable name: 'x'.
	y := SymbolicVariable name: 'y'.
	e1 := Addition exp1: x exp2: 3.
	e2 := Multiplication exp1: e1 exp2: x.
	e3 := Addition exp1: 20 exp2: (Multiplication exp1: 3.14 exp2: y).
	x printOn: Transcript.
	Transcript cr.
	e1 printOn: Transcript.
	Transcript cr.
	e2 printOn: Transcript.
	Transcript cr.
	e3 printOn: Transcript.
	Transcript cr.
	(x deriv: x) printOn: Transcript.
	Transcript cr.
	(3 deriv: x) printOn: Transcript.
	Transcript cr.
	(e1 deriv: x) printOn: Transcript.
	Transcript cr.
	(e2 deriv: x) printOn: Transcript.
	Transcript cr.
	(e3 deriv: x) printOn: Transcript.
	Transcript cr.
	Transcript flush! !

!SymbolicExpression class methodsFor: 'tests' stamp: 'AB 11/10/2006 22:10'!
test2
	"SymbolicExpression test2"
		| x y e1 e2 e3 |
	"like test1, except that it uses infix notation to create expressions"
	x := SymbolicVariable name: 'x'.
	y := SymbolicVariable name: 'y'.
	e1 := x+3.
	e2 := e1*x.
	e3 := 20 + (3.14*y).
	x printOn: Transcript.
	Transcript cr.
	e1 printOn: Transcript.
	Transcript cr.
	e2 printOn: Transcript.
	Transcript cr.
	e3 printOn: Transcript.
	Transcript cr.
	(x deriv: x) printOn: Transcript.
	Transcript cr.
	(3 deriv: x) printOn: Transcript.
	Transcript cr.
	(e1 deriv: x) printOn: Transcript.
	Transcript cr.
	(e2 deriv: x) printOn: Transcript.
	Transcript cr.
	(e3 deriv: x) printOn: Transcript.
	Transcript cr.
	Transcript flush! !

!SymbolicExpression class methodsFor: 'tests' stamp: 'AB 11/10/2006 22:27'!
test3
	"SymbolicExpression test3"
		| x y e1 e2 dict |
	"demonstrate evaluation"
	x := SymbolicVariable name: 'x'.
	y := SymbolicVariable name: 'y'.
	e1 := x+3.
	e2 := e1*y.
	dict := Dictionary new.
	dict at: 'x' put: 10.
	dict at: 'y' put: 20.
	e1 printOn: Transcript.
	Transcript cr.
	e2 printOn: Transcript.
	Transcript cr.
	(e1 evaluate: dict) printOn: Transcript.
	Transcript cr.
	(e2 evaluate: dict) printOn: Transcript.
	Transcript cr.
	(e2 deriv: x) printOn: Transcript.
	Transcript cr.
	((e2 deriv: x) evaluate: dict) printOn: Transcript.
	Transcript cr.
	Transcript flush! !


SymbolicExpression subclass: #Addition
	instanceVariableNames: 'exp1 exp2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Differentiation'!

!Addition methodsFor: 'initialization' stamp: 'ab 11/11/2005 20:54'!
exp1: e1 exp2: e2
	exp1 _ e1.
	exp2 _ e2.
! !


!Addition methodsFor: 'derivatives' stamp: 'ab 11/11/2005 21:05'!
deriv: v 
	^Addition exp1: (exp1 deriv: v) exp2: (exp2 deriv: v)
! !


!Addition methodsFor: 'evaluation' stamp: 'AB 11/10/2006 22:16'!
evaluate: dict
	"evaluate this expression in the context given by dict"
	^(exp1 evaluate: dict) + (exp2 evaluate: dict)! !


!Addition methodsFor: 'printing' stamp: 'ab 11/11/2005 20:56'!
printOn: strm
	strm nextPut: $(.
	exp1 printOn: strm.
	strm nextPut: $+.
	exp2 printOn: strm.
	strm nextPut: $).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Addition class
	instanceVariableNames: ''!

!Addition class methodsFor: 'instance creation' stamp: 'AB 11/10/2006 22:02'!
exp1: e1 exp2: e2
	"return a symbolic expression that is equivalent to e1+e2, simplifying if possible"
	(e1 isNumber and: [e2 isNumber]) ifTrue: [^e1+e2].
	e1=0 ifTrue: [^e2].
	e2=0 ifTrue: [^e1].
	^self new exp1: e1 exp2: e2! !

SymbolicExpression subclass: #Multiplication
	instanceVariableNames: 'exp1 exp2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Differentiation'!

!Multiplication methodsFor: 'initialization' stamp: 'ab 11/11/2005 20:55'!
exp1: e1 exp2: e2
	exp1 := e1.
	exp2 := e2.
! !


!Multiplication methodsFor: 'derivatives' stamp: 'ab 11/11/2005 21:08'!
deriv: v 
		| x y |
	x _ Multiplication exp1: exp2 exp2: (exp1 deriv: v).
	y _ Multiplication exp1: exp1 exp2: (exp2 deriv: v).
	^Addition exp1: x exp2: y! !


!Multiplication methodsFor: 'evaluation' stamp: 'AB 11/10/2006 22:17'!
evaluate: dict
	"evaluate this expression in the context given by dict"
	^(exp1 evaluate: dict) * (exp2 evaluate: dict)! !


!Multiplication methodsFor: 'printing' stamp: 'ab 11/11/2005 20:57'!
printOn: strm
	strm nextPut: $(.
	exp1 printOn: strm.
	strm nextPut: $*.
	exp2 printOn: strm.
	strm nextPut: $).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Multiplication class
	instanceVariableNames: ''!

!Multiplication class methodsFor: 'instance creation' stamp: 'AB 11/10/2006 22:03'!
exp1: e1 exp2: e2
	"return a symbolic expression that is equivalent to e1*e2, simplifying if possible"
	(e1 isNumber and: [e2 isNumber]) ifTrue: [^e1*e2].
	e1=0 ifTrue: [^0].
	e2=0 ifTrue: [^0].
	e1=1 ifTrue: [^e2].
	e2=1 ifTrue: [^e1].
	^self new exp1: e1 exp2: e2
! !


SymbolicExpression subclass: #SymbolicVariable
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Differentiation'!

!SymbolicVariable methodsFor: 'name' stamp: 'ab 11/11/2005 21:04'!
name 
	^name! !

!SymbolicVariable methodsFor: 'name' stamp: 'ab 11/11/2005 20:52'!
name: n
	name _ n
! !


!SymbolicVariable methodsFor: 'derivatives' stamp: 'ab 11/11/2005 21:05'!
deriv: v 
	self=v ifTrue: [^1] ifFalse: [^0]! !


!SymbolicVariable methodsFor: 'evaluation' stamp: 'AB 11/10/2006 22:25'!
evaluate: dict
	"evaluate this expression in the context given by dict"
	^dict at: name ifAbsent: [self error: 'variable name ' , name , ' not found in dictionary']! !


!SymbolicVariable methodsFor: 'equality test' stamp: 'ab 11/11/2005 21:04'!
= x
	x class = SymbolicVariable ifFalse: [^false].
	^name = x name ! !


!SymbolicVariable methodsFor: 'printing' stamp: 'ab 11/11/2005 21:02'!
printOn: strm
	strm nextPutAll: name
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

SymbolicVariable class
	instanceVariableNames: ''!

!SymbolicVariable class methodsFor: 'instance creation' stamp: 'ab 11/11/2005 20:53'!
name: n
	^ self new name: n! !