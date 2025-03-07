Class {
	#name : #TBMBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #TinyBlog
}

{ #category : #'adding/removing methods' }
TBMBlog class >> createDemoPosts [
	"TBBlog createDemoPosts"
	self current
		writeBlogPost: ((TBMPost title: 'Welcome in TinyBlog' text: 'TinyBlog is a small blog engine made with Pharo.' category: 'TinyBlog') visible: true);
		writeBlogPost: ((TBMPost title: 'Report Pharo Sprint' text: 'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a nice event with more than 15 motivated sprinters. With the help of candies, cakes and chocolate, huge work has been done' category: 'Pharo') visible: true);
		writeBlogPost: ((TBMPost title: 'Brick on top of Bloc - Preview' text: 'We are happy to announce the first preview version of Brick, a new widget set created from scratch on top of Bloc. Brick is being developed primarily by Alex Syrel (together with Alain Plantec, Andrei Chis and myself), and the
work is sponsored by ESUG. Brick is part of the Glamorous Toolkit effort and will provide
the basis for the new versions of the development tools.' category: 'Pharo') visible: true);
		writeBlogPost: ((TBMPost title: 'The sad story of unclassified blog posts' text: 'So sad that I can read this.') visible: true);
		writeBlogPost: ((TBMPost title: 'Working with Pharo on the Raspberry Pi' text: 'Hardware is getting cheaper and many new small devices like the famous Raspberry Pi provide new computation power that was one once only available on regular desktop computers.' category: 'Pharo') visible: true)
]

{ #category : #initialization }
TBMBlog class >> current [ 
	"Answer the instance of the class"
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #initialization }
TBMBlog class >> initialize [ 
	self reset 
]

{ #category : #initialization }
TBMBlog class >> reset [ 
	uniqueInstance := nil
]

{ #category : #acccessing }
TBMBlog >> allBlogPosts [
	^ posts
]

{ #category : #acccessing }
TBMBlog >> allBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory ]
]

{ #category : #acccessing }
TBMBlog >> allCategories [
	^ (self allBlogPosts collect: [ :p | p category ]) asSet

]

{ #category : #acccessing }
TBMBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #acccessing }
TBMBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory and: [ p isVisible ] ]

]

{ #category : #initialization }
TBMBlog >> initialize [ 

	super initialize.
	posts := OrderedCollection new.
]

{ #category : #removing }
TBMBlog >> removeAllPosts [
	posts := OrderedCollection new
]

{ #category : #action }
TBMBlog >> size [ 	
	^ posts size 
]

{ #category : #'adding/removing' }
TBMBlog >> writeBlogPost: aPost [
	"Add the blog post to the list of posts."
	posts add: aPost
]
