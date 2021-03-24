Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'currentCategory'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBPostsListComponent >> basicRenderCategoriesOn: html [
	html render: self categoriesComponent

]

{ #category : #rendering }
TBPostsListComponent >> basicRenderPostsOn: html [
	self readSelectedPosts do: [ :p |
		html render: (self postComponentFor: p) ]
]

{ #category : #accessing }
TBPostsListComponent >> categoriesComponent [
	^ TBCategoriesComponent
		categories: self blog allCategories
		postsList: self
]

{ #category : #accessing }
TBPostsListComponent >> currentCategory [
	^ currentCategory

]

{ #category : #accessing }
TBPostsListComponent >> currentCategory: anObject [
	currentCategory := anObject
	
]

{ #category : #creation }
TBPostsListComponent >> postComponentFor: aPost [
	^ TBPostComponent new post: aPost
]

{ #category : #accessing }
TBPostsListComponent >> readSelectedPosts [
	^ self currentCategory
		ifNil: [ self blog allVisibleBlogPosts ]
		ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self currentCategory ]
]

{ #category : #rendering }
TBPostsListComponent >> renderCategoryColumnOn: html [
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ self basicRenderCategoriesOn: html ]
]

{ #category : #rendering }
TBPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html tbsRow showGrid;
			with: [ self renderCategoryColumnOn: html.
					self renderPostColumnOn: html ] ]

]

{ #category : #rendering }
TBPostsListComponent >> renderPostColumnOn: html [
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with: [ self basicRenderPostsOn: html ]
]
