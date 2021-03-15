"
TypeError signals that an argument of a method is not set with the expected type. It has a typeMessageText for a wrong type of argument of a message and it can have a standardMessageText, that should be overwritten if used. you can instantiate and use TypeError with the methods shown in TypeErrorTest. 

"
Class {
	#name : #TypeError,
	#superclass : #Error,
	#instVars : [
		'type'
	],
	#category : #'GenerallyUsable-Basic'
}

{ #category : #'instance creation' }
TypeError class >> type:aValueTypeOrString [
	^self new 
		type: aValueTypeOrString;
		signal
]

{ #category : #accessing }
TypeError >> messageText [
"Overwritten to initialize the message text to a typeMessageText 
 (or a standardMessageText if #type has not been set)"

	^ messageText ifNil: [type
				ifNil: [ self standardMessageText ]
				ifNotNil: [ self typeMessageText ]]
]

{ #category : #accessing }
TypeError >> standardMessageText [ 
"should be overwritten by subclass if type can be nil! An example is PatternError in package Pattern2"
^'Unspecified TypeError in #{1}'format: (Array with: self signalerContext methodSelector)
]

{ #category : #accessing }
TypeError >> type: aValueTypeOrString [
"type is a String that describes an argument's domain"
^type := aValueTypeOrString asString 
]

{ #category : #accessing }
TypeError >> typeMessageText [
"type is a String that describes an argument's domain"
^'Argument of #{1} is no {2}!'format: (Array with: self signalerContext methodSelector with: type)
]
