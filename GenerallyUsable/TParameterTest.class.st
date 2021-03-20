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
		equals: (Dictionary newFromPairs:#(specialVar 10 var2 nil #var3 4));
		assert: (a parameter: #(var3 3 #specialVar 5)) 
		equals: (Dictionary newFromPairs:#(#specialVar 6 #var2 nil #var3 3)).
	a parameter: {#specialVar->9. #var3->'3'. #var2 ->'4'} . 
	self 
		assert: a parameter 
		equals: (Dictionary newFromPairs:#(#specialVar 10 #var2 '4' #var3 '3')).
	[ a parameter: (Dictionary newFromPairs:#(#var4 10)) ]on: Error do: [ :e | 
		self 
			assert: e class equals: TypeError;
			assert: (e messageText includesSubstring: 'var4' )]."var4 has not the necessary accessors with the same name, hence it is no parameter, see ParameterSample class"
	[ a parameter: #(#var1 10) ]on: Error do: [ :e | 
		self 
			assert: e class equals: TypeError;
			assert: (e messageText includesSubstring: 'var1' )]."var1 has been a removed parameter, see ParameterSample class"
	self 
		should: [ a parameter: 5 ] raise: TypeError;
		should: [ a parameter: #(5 #size ) ] raise: TypeError;
		should: [ a parameter: #( ) ] raise: CollectionIsEmpty;
		should: [ a parameter: #(#size 4)asSet ] raise: TypeError;
		should: [ a parameter: #(#size 5 #var2 ) ] raise: TypeError.
	
	
]
