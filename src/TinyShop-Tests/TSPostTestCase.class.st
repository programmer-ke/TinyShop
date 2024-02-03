Class {
	#name : #TSPostTestCase,
	#superclass : #TestCase,
	#category : #'TinyShop-Tests'
}

{ #category : #tests }
TSPostTestCase >> testBeVisible [ 
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	| post |
	post := TSPost new.
	post beVisible.
	self assert: post visible equals: true
]

{ #category : #tests }
TSPostTestCase >> testNotVisible [ 
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	| post |
	post := TSPost new.
	post notVisible.
	self assert: post visible equals: false
]

{ #category : #tests }
TSPostTestCase >> testPostIsCreatedCorrectly [ 
    | post |
    post := TSPost
        title: 'sometitle'
        text: 'some text'
        category: 'general'.
    self assert: post title equals: 'sometitle'.
    self assert: post text equals: 'some text'.
    self assert: post category equals: 'general'.
    
]

{ #category : #tests }
TSPostTestCase >> testWithoutCategoryIsUnclassified [ 
    | post |
    post := TSPost
        title: 'sometitle'
        text: 'some text'. 
    self assert: post title equals: 'sometitle'.
    self assert: post isUnclassified.
    self deny: post isVisible.
    
]
