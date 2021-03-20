"
ParameterSample is used in TParameterTest.
"
Class {
	#name : #ParameterSample,
	#superclass : #Object,
	#traits : 'TParameter',
	#classTraits : 'TParameter classTrait',
	#instVars : [
		'var1',
		'var2',
		'var3',
		'var4'
	],
	#category : #'GenerallyUsable-Tests'
}

{ #category : #accessing }
ParameterSample class >> manipulateParameters: aCollectionOfNames [
aCollectionOfNames add:#specialVar.
^aCollectionOfNames
]

{ #category : #accessing }
ParameterSample class >> removeParameters [ 
^#(#var1 #blabla)
]

{ #category : #initialization }
ParameterSample >> initialize [
self specialVar: 9.
]

{ #category : #accessing }
ParameterSample >> specialVar [
	^ var4 - 3
]

{ #category : #accessing }
ParameterSample >> specialVar: aNumber [
	var4 := aNumber+4
]

{ #category : #accessing }
ParameterSample >> var1 [
	^ var1
]

{ #category : #accessing }
ParameterSample >> var1: anObject [
	var1 := anObject
]

{ #category : #accessing }
ParameterSample >> var2 [
	^ var2
]

{ #category : #accessing }
ParameterSample >> var2: anObject [
	var2 := anObject
]

{ #category : #accessing }
ParameterSample >> var3 [
	^ var3 ifNil: [ ^var3:=4 ]
]

{ #category : #accessing }
ParameterSample >> var3: anObject [
	var3 := anObject
]
