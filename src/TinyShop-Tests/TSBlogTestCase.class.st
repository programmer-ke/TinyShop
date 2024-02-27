Class {
	#name : #TSBlogTestCase,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #'TinyShop-Tests'
}

{ #category : #running }
TSBlogTestCase >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	blog := TSBlog current.
	blog removeAllPosts.
	
	first := TSPost title: 'A title' text: 'Some text' category: 'First Category'.
	blog writeBlogPost: first.
	
	post := (TSPost title: 'Another title' text: 'some other text' category: 'Second Category') beVisible
]

{ #category : #running }
TSBlogTestCase >> tearDown [
	TSBlog reset

]

{ #category : #tests }
TSBlogTestCase >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2
]

{ #category : #tests }
TSBlogTestCase >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allBlogPosts size equals: 2
]

{ #category : #tests }
TSBlogTestCase >> testAllVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #tests }
TSBlogTestCase >> testRemoveAllBlogPosts [
	blog removeAllPosts.
	self assert: blog size equals: 0
]

{ #category : #tests }
TSBlogTestCase >> testSize [
	self assert: blog size equals: 1
]
