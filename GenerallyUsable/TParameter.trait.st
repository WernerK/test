"
TParameter lets you set and receive the values of all or some instance variables via a dictionary or Array.If you want to exclude some instance variables overwrite class>>removeParameters or alternatively class>>manipulateParameters: aCollectionOfNames. since the setting of the values via #parameter: is optional (you can choose which ones you set) they need to be set via default values initially, eg by initialize or via (#value ^value ifNil: [value:=default]).
"
Trait {
	#name : #TParameter,
	#category : #'GenerallyUsable-Basic'
}

{ #category : #accessing }
TParameter classSide >> manipulateParameters: aCollectionOfNames [
"this could be overwritten if aCollectionOfNames needs to be changed somehow. it is more flexible than #removeParameters, as for example it can replace a variable name by the name of its accessors, should they be different. or it could be used to remove (or add again) an additional parameter in a subclass which inherits the trait from its superclass, which already uses #removeParameters. in any way it has to return the eventually manipulated aCollectionOfNames!"
^aCollectionOfNames
]

{ #category : #accessing }
TParameter classSide >> removeParameters [ 
"by default removes nothing. can be overwritten. should return an Array of instance variables"
^#()
]

{ #category : #accessing }
TParameter >> defaultParameters [
	"there are two overwritable hooks into this method: you should change TPatternParameter class>> removeParameters if you want to exclude some vars or you can overwrite #manipulateParameters:"

	| names|
	names := self class allInstVarNames asOrderedCollection . 
	self class removeParameters do: [:each | names remove: each ifAbsent:[] ].
	names:=self class manipulateParameters:names.
	names := names reject: [ :n | 
			(self class lookupSelector: n , ':') isNil or:[
				(self class lookupSelector: n) isNil] ].
	^ names asArray
]

{ #category : #accessing }
TParameter >> isValidParameter: aDictionary [
	| d |
"method returns a Dictionary, if aDictionary is a valid parameter. the second line with its transformation exists, because i find Dictionarys difficult to use interactively, Arrays are faster to write"
	aDictionary isCollection ifFalse: [ ^TypeError type:'collection' ].
	d := aDictionary isSequenceable
		ifTrue: [ (aDictionary allSatisfy: [ :a|a class == Association])
				ifTrue: [ aDictionary asDictionary ]
				ifFalse: [ aDictionary size even 
					ifTrue: [Dictionary newFromPairs: aDictionary] 
					ifFalse:[aDictionary] ] ]
		ifFalse: [ aDictionary ]. 
	d isDictionary ifFalse: [ ^ TypeError
				type: 'Dictionary or Array of pairs or of Associations' ].
	d keysDo: [ :k | self defaultParameters
				detect: [ :x | x = k ]
				ifNone: [ ^ TypeError 
					signal: 'Argument of #parameter: has an invalid key: ', k asString ] ].
	d ifEmpty: [ ^ CollectionIsEmpty signalWith: d ].
	^d
]

{ #category : #accessing }
TParameter >> parameter [
	| names |
	names := self defaultParameters .
	^ Dictionary
		newFromKeys: names
		andValues: (names collect: [ :n | self perform: n ])
]

{ #category : #accessing }
TParameter >> parameter: aDictionary [
	(self isValidParameter: aDictionary)  
		keysAndValuesDo: [ :k :v | self perform: k , ':' with: v ].
	^ self parameter
]
