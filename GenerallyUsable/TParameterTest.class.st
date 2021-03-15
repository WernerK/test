"
uses ParameterSample for testing TParameter
"
Class {
	#name : #TParameterTest,
	#superclass : #TestCase,
	#instVars : [
		'sample'
	],
	#category : #'GenerallyUsable-Tests'
}

{ #category : #tests }
TParameterTest >> test [ 
	| a |
	a := ParameterSample new.
	self 
		assert: a parameter 
		equals: (Dictionary newFromPairs:#(#specialVar 10 #var2 nil #var3 4)).
	self 
		assert: (a parameter: #(#var3 3 #specialVar 5)) 
		equals: (Dictionary newFromPairs:#(#specialVar 6 #var2 nil #var3 3)).
	a parameter: {#specialVar->9. #var3->'3'. #var2 ->'4'} . 
	self 
		assert: a parameter 
		equals: (Dictionary newFromPairs:#(#specialVar 10 #var2 '4' #var3 '3')).
	[ a parameter: #(#var4 10) ]on: Error do: [ :e | 
		self 
			assert: e class equals: TypeError;
			assert: (e messageText includesSubstring: 'var4' )].
	[ a parameter: #(#var1 10) ]on: Error do: [ :e | 
		self 
			assert: e class equals: TypeError;
			assert: (e messageText includesSubstring: 'var1' )].
	
]
