Class {
	#name : #TSPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #TinyShop
}

{ #category : #'as yet unclassified' }
TSPost class >> title: aTitle text: aText [
	"instantiate post"
	"scope: class-variables  &  class-instance-variables"	
			
	^ self new
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #'as yet unclassified' }
TSPost class >> title: aTitle text: aText category: aCategory [
	"instantiate a post"
	"scope: class-variables  &  class-instance-variables"	
			
	^ (self title: aTitle text: aText)
			category: aCategory;
			yourself
			
]

{ #category : #'as yet unclassified' }
TSPost class >> unclassifiedTag [
	"returns a tag for unclassified posts"
	"scope: class-variables  &  class-instance-variables"	
			
	^ 'Unclassified'
]

{ #category : #action }
TSPost >> beVisible [
	"set post to visible"
	"scope: instance variables"	
			
	self visible: true
]

{ #category : #accessing }
TSPost >> category [
	^ category
]

{ #category : #accessing }
TSPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
TSPost >> date [
	^ date
]

{ #category : #accessing }
TSPost >> date: aDate [ 
	date := aDate
]

{ #category : #initialization }
TSPost >> initialize [ 
			
	super initialize.
	self category: self class unclassifiedTag.
	self date: Date today.
	self notVisible
]

{ #category : #testing }
TSPost >> isUnclassified [
    ^ self category = self class unclassifiedTag
]

{ #category : #testing }
TSPost >> isVisible [
    ^ self visible
]

{ #category : #action }
TSPost >> notVisible [
	"set post to not visible"
	"scope: instance-variables"	
			
	self visible: false
]

{ #category : #accessing }
TSPost >> text [
	^ text
]

{ #category : #accessing }
TSPost >> text: aString [
	text := aString
]

{ #category : #accessing }
TSPost >> title [
	^ title
]

{ #category : #accessing }
TSPost >> title: aString [
	title := aString
]

{ #category : #accessing }
TSPost >> visible [
	^ visible
]

{ #category : #accessing }
TSPost >> visible: aBoolean [
	visible := aBoolean
]
