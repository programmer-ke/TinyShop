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
TSBlog class >> createDemoPosts [
	self current
writeBlogPost: ((TSPost title: 'Welcome in TinyBlog' text:
'TinyBlog is a small blog engine made with Pharo.' category:
'TinyBlog') visible: true);
writeBlogPost: ((TSPost title: 'Report Pharo Sprint' text:
'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
nice event with more than 15 motivated sprinters. With the help
of candies, cakes and chocolate, huge work has been done'
category: 'Pharo') visible: true);
writeBlogPost: ((TSPost title: 'Brick on top of Bloc -
Preview' text: 'We are happy to announce the first preview
version of Brick, a new widget set created from scratch on top
of Bloc. Brick is being developed primarily by Alex Syrel
(together with Alain Plantec, Andrei Chis and myself), and the
work is sponsored by ESUG.
Brick is part of the Glamorous Toolkit effort and will provide
the basis for the new versions of the development tools.'
category: 'Pharo') visible: true);
writeBlogPost: ((TSPost title: 'The sad story of unclassified
blog posts' text: 'So sad that I can read this.') visible: true);
writeBlogPost: ((TSPost title: 'Working with Pharo on the
Raspberry Pi' text: 'Hardware is getting cheaper and many new
small devices like the famous Raspberry Pi provide new
computation power that was one once only available on regular
desktop computers.' category: 'Pharo') visible: true)
]

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

{ #category : #getter }
TSBlog >> allBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category =aCategory ]
	
]

{ #category : #'as yet unclassified' }
TSBlog >> allCategories [
	^ (self allBlogPosts collect: [ :p | p category ]) asSet
]

{ #category : #accessors }
TSBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #'get list' }
TSBlog >> allVisibleBlogPostsFromCategory: aCategory [ 
	^ posts select: [ :p | p category = aCategory and: [ p isVisible ] ]
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
