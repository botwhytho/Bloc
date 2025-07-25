"
I contain examples of rope iterators

"
Class {
	#name : #BlRopeIteratorExamples,
	#superclass : #Object,
	#category : #'Bloc-Examples-Rope'
}

{ #category : #'examples - next segment' }
BlRopeIteratorExamples >> nextWordWithGtDefinition [
	<gtExample>
	| anIterator words |
	anIterator := self wordMovementIterator.
	words := OrderedCollection new.
	[ anIterator hasNext ] whileTrue: [ words add: anIterator nextWord ].
	self
		assert: (words asArray collect: #asString)
		equals: {'Foo'.
				'Bar'.
				' '.
				':='.
				' '.
				'34'.
				' '.
				'+'.
				' '.
				'a'.
				'Camel'.
				'Case_mixed_with_underscores'}.
	^ anIterator
]

{ #category : #'examples - next segment' }
BlRopeIteratorExamples >> nextWordWithGtDefinitionInMiddle [
	<gtExample>
	| anIterator |
	anIterator := self wordMovementIterator.
	anIterator position: 3.
	self assert: anIterator nextWord asString equals: 'Bar'.
	self assert: anIterator position equals: 6.
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_123Cr_at_0 [
	<gtExample>
	| anIterator |
	
	anIterator := (BlCollectionRope collection: '123', String cr) iterator.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 0.
		self assert: anEnd equals: 3.
		self assert: anEndDelimiter equals: 4 ].

	self assert: anIterator position equals: 4.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_123Crabc_at_0 [
	<gtExample>
	| anIterator |
	
	anIterator := (BlCollectionRope collection: '123', String cr, 'abc') iterator.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 0.
		self assert: anEnd equals: 3.
		self assert: anEndDelimiter equals: 4 ].

	self assert: anIterator position equals: 4.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_123Crabc_at_4 [
	<gtExample>
	| anIterator |
	
	anIterator := self next_line_123Crabc_at_0.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 4.
		self assert: anEnd equals: 7.
		self assert: anEndDelimiter equals: 7 ].

	self assert: anIterator position equals: 7.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_123_at_0 [
	<gtExample>
	| anIterator |
	
	anIterator := (BlCollectionRope collection: '123') iterator.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 0.
		self assert: anEnd equals: 3.
		self assert: anEndDelimiter equals: 3 ].

	self assert: anIterator position equals: 3.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_Cr123_at_0 [
	<gtExample>
	| anIterator |
	
	anIterator := (BlCollectionRope collection: String cr, '123') iterator.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_Cr123_at_1 [
	<gtExample>
	| anIterator |
	
	anIterator := self next_line_Cr123_at_0.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 1.
		self assert: anEnd equals: 4.
		self assert: anEndDelimiter equals: 4 ].

	self assert: anIterator position equals: 4.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_Cr1_at_0 [
	<gtExample>
	| anIterator |
	
	anIterator := (BlCollectionRope collection: String cr, '1') iterator.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_Cr1_at_1 [
	<gtExample>
	| anIterator |
	
	anIterator := self next_line_Cr1_at_0.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 1.
		self assert: anEnd equals: 2.
		self assert: anEndDelimiter equals: 2 ].

	self assert: anIterator position equals: 2.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_CrCr_at_0 [
	<gtExample>
	| anIterator |
	
	anIterator := (BlCollectionRope collection: String cr, String cr) iterator.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_CrCr_at_1 [
	<gtExample>
	| anIterator |
	
	anIterator := self next_line_CrCr_at_0.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 1.
		self assert: anEnd equals: 1.
		self assert: anEndDelimiter equals: 2 ].

	self assert: anIterator position equals: 2.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_CrLf_at_0 [
	<gtExample>
	| anIterator |
	
	anIterator := (BlCollectionRope collection: String crlf) iterator.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 2 ].

	self assert: anIterator position equals: 2.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_Cr_at_0 [
	<gtExample>
	| anIterator |
	
	anIterator := (BlCollectionRope collection: String cr) iterator.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.
	
	^ anIterator
]

{ #category : #'examples - next line' }
BlRopeIteratorExamples >> next_line_Lf_at_0 [
	<gtExample>
	| anIterator |
	
	anIterator := (BlCollectionRope collection: String lf) iterator.
	
	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter |
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.
	
	^ anIterator
]

{ #category : #'examples - next segment' }
BlRopeIteratorExamples >> next_segment_123abc_at_0 [
	<gtExample>
	| aRope anIterator aSegment |
	
	aRope := BlCollectionRope collection: '123abc'.
	anIterator := aRope iterator.
	
	aSegment := anIterator nextSegment: [ :aChar | aChar isDigit ].
	
	self assert: aSegment collection equals: '123'.
	self assert: anIterator position equals: 3.

	^ anIterator
]

{ #category : #'examples - next segment' }
BlRopeIteratorExamples >> next_segment_123abc_at_3 [
	<gtExample>
	| anIterator aSegment |

	anIterator := self next_segment_123abc_at_0.
	
	aSegment := anIterator nextSegment: [ :aChar | aChar isDigit ].
	
	self assert: aSegment collection equals: 'abc'.
	self assert: anIterator position equals: 6.

	^ anIterator
]

{ #category : #'examples - next segment' }
BlRopeIteratorExamples >> next_segment_123abc_at_6 [
	<gtExample>
	<label: 'Iterator throws an error when the end is reached'>
	| anIterator anError |

	anIterator := self next_segment_123abc_at_3.
	
	anError := nil.
	[ anIterator nextSegment: [ :aChar | aChar isDigit ]. ] on: Error do: [ :e | anError := e ].
	
	self assert: anError isNotNil.

	^ anIterator
]

{ #category : #'examples - next segment' }
BlRopeIteratorExamples >> next_segment_a_at_0 [
	<gtExample>
	| aRope anIterator aSegment |
	
	aRope := BlCollectionRope collection: 'a'.
	anIterator := aRope iterator.
	
	aSegment := anIterator nextSegment: [ :aChar | aChar isDigit ].
	
	self assert: aSegment collection equals: 'a'.
	self assert: anIterator position equals: 1.

	^ anIterator
]

{ #category : #'examples - next segment' }
BlRopeIteratorExamples >> next_segment_abc_at_0 [
	<gtExample>
	| aRope anIterator aSegment |
	
	aRope := BlCollectionRope collection: 'abc'.
	anIterator := aRope iterator.
	
	aSegment := anIterator nextSegment: [ :aChar | aChar isDigit ].
	
	self assert: aSegment collection equals: 'abc'.
	self assert: anIterator position equals: 3.

	^ anIterator
]

{ #category : #'examples - next segment' }
BlRopeIteratorExamples >> prevWordWithGtDefinition [
	<gtExample>
	| anIterator words |
	anIterator := self wordMovementIterator skipToEnd.
	words := OrderedCollection new.
	[ anIterator hasPrevious ]
		whileTrue: [ words add: anIterator prevWord asString ].
	self
		assert: words asArray
		equals: {'Case_mixed_with_underscores'.
				'Camel'.
				'a'.
				' '.
				'+'.
				' '.
				'34'.
				' '.
				':='.
				' '.
				'Bar'.
				'Foo'}.
	^ anIterator
]

{ #category : #accessing }
BlRopeIteratorExamples >> reverseIterator [

	<gtExample>
	| rope coll1 coll2 fi ri collectionRope |
	collectionRope := BlCollectionRope collection: (1 to: 3).
	rope := BlConcatenationRope
		        left: (BlSubRope rope: collectionRope offset: 0 length: 1)
		        right: (BlConcatenationRope
				         left:
				         (BlSubRope rope: collectionRope offset: 2 length: 1)
				         right: (BlCollectionRope collection: (4 to: 6))).
	coll1 := OrderedCollection new.
	coll2 := OrderedCollection new.
	fi := rope iterator.
	[ fi hasNext ] whileTrue: [ coll1 addLast: fi next ].
	ri := rope iterator.
	ri skip: rope size.
	[ ri hasPrevious ] whileTrue: [ coll2 addFirst: ri previous ].
	self assert: coll1 = coll2.
	^rope
]

{ #category : #'examples - next segment' }
BlRopeIteratorExamples >> wordMovementIterator [
	| aRope |
	aRope := BlCollectionRope
			collection: 'FooBar := 34 + aCamelCase_mixed_with_underscores'.
	^ aRope iterator
]
