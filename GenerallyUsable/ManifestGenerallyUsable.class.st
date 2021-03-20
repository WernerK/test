"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGenerallyUsable,
	#superclass : #PackageManifest,
	#category : #'GenerallyUsable-Manifest'
}

{ #category : #'code-critics' }
ManifestGenerallyUsable class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#TParameter #parameter: #false)) #'2021-03-20T18:01:10.725754+01:00') )
]

{ #category : #'code-critics' }
ManifestGenerallyUsable class >> ruleRBContainsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#TParameter #isValidParameter: #false)) #'2021-03-20T18:01:51.050357+01:00') )
]

{ #category : #'code-critics' }
ManifestGenerallyUsable class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#TParameter #defaultParameters #false)) #'2021-03-20T18:01:25.31143+01:00') #(#(#RGMethodDefinition #(#TParameter #isValidParameter: #false)) #'2021-03-20T18:02:07.211311+01:00') )
]
