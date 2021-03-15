"
shows the 3 ways you can use a TypeError: 
with a typeMessageText , a standardMessageText or a messageText .
"
Class {
	#name : #TypeErrorTest,
	#superclass : #TestCase,
	#category : #'GenerallyUsable-Tests'
}

{ #category : #running }
TypeErrorTest >> test: aValue [
aValue ifNil: 	[ ^ TypeError type: 'notNil value' ].
^aValue

]

{ #category : #tests }
TypeErrorTest >> testMessage [
	[ ^ TypeError signal ]
		on: Error
		do: [ :e | self assert: e messageText equals: e standardMessageText ].
	[ ^ TypeError signal: 'eee' ]
		on: Error
		do: [ :e | self assert: e messageText equals: 'eee' ].
	self test:5.
	[ self test: nil ]
		on: Error
		do: [ :e | 
			self
				assert: e messageText
				equals: 'Argument of #test: is no notNil value!' ].
	[ ^ TypeError type: Integer ]
		on: Error
		do: [ :e | 
			self
				assert: e messageText
				equals: 'Argument of #testMessage is no Integer!' ]
]
