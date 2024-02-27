Class {
	#name : #TSBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #TinyShop
}

{ #category : #initialization }
TSBlog class >> current [
	""
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #initialization }
TSBlog class >> initialize [ 
	self reset
]

{ #category : #initialization }
TSBlog class >> reset [
	uniqueInstance := nil
]

{ #category : #accessors }
TSBlog >> allBlogPosts [
	^ posts
]

{ #category : #accessors }
TSBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #initialization }
TSBlog >> initialize [ 
	super initialize.
	posts := OrderedCollection new
]

{ #category : #actions }
TSBlog >> removeAllPosts [
	posts := OrderedCollection new
]

{ #category : #accessing }
TSBlog >> size [
	^ posts size
]

{ #category : #actions }
TSBlog >> writeBlogPost: aTSPost [
	"Add blog post to list of posts"
	posts add: aTSPost
]
