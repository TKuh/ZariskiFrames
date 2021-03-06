#! @System OpenSubsetOfSpec

LoadPackage( "ZariskiFrames" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( ZZ );
#! The frame of Zariski open subsets of the affine spectrum of Z
A := OpenSubsetOfSpecByReducedMorphism( HomalgMatrix( [ 2 ], 1, 1, ZZ ) );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
B := OpenSubsetOfSpec( HomalgMatrix( [ 12,20 ], 2, 1, ZZ ) );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
C := OpenSubsetOfSpecByReducedMorphism( HomalgMatrix( [ 3 ], 1, 1, ZZ ) );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
D := OpenSubsetOfSpec( HomalgMatrix( [ 12 ], 1, 1, ZZ ) );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
A = B;
#! true
A = C;
#! false
embAB := UniqueMorphism( A, B );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAB );
#! true
IsIsomorphism( embAB );
#! true
embAC := UniqueMorphism( A, C );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAC );
#! false
embDA := UniqueMorphism( D, A );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embDA );
#! true
IsSubset( A, D );
#! true
IsIsomorphism( embDA );
#! false
embAD := UniqueMorphism( A, D );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAD );
#! false
IsSubset( D, A );
#! false
T := TerminalObject( ZF );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
Display( T );
#! [ [  1 ] ]
#! 
#! A morphism in Rows( Z )
I := InitialObject( ZF );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
Display( I );
#! (an empty 0 x 1 matrix)
#! 
#! A morphism in Rows( Z )
AvC := Coproduct( A, C );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
Display( AvC );
#! [ [  2 ],
#!   [  3 ] ]
#! A morphism in Rows( Z )
Coproduct( A, C ) = T;
#! true
AC := DirectProduct( A, C );
#! <An object in The frame of Zariski open subsets of the affine spectrum of Z>
Display( AC );
#! [ [  -6 ] ]
#! 
#! A morphism in Rows( Z )
StandardMorphismOfUnderlyingCategory( AC );
#! <A morphism in Rows( Z )>
Display( AC );
#! [ [  6 ] ]
#! 
#! A morphism in Rows( Z )
InternalHomOnObjects( I, T ) = T;
#! true
InternalHomOnObjects( A, T ) = T;
#! true
InternalHomOnObjects( T, T ) = T;
#! true
InternalHomOnObjects( T, A ) = A;
#! true
InternalHomOnObjects( T, I ) = I;
#! true
InternalHomOnObjects( A, I ) = I;
#! true
InternalHomOnObjects( I, I ) = T;
#! true
InternalHomOnObjects( D, B ) = T;
#! true
InternalHomOnObjects( B, D ) = C;
#! true
InternalHomOnObjects( D, C ) = T;
#! true
InternalHomOnObjects( C, D ) = B;
#! true
IsWellDefined( EvaluationMorphism( A, C ) );
#! true
IsIsomorphism( EvaluationMorphism( A, C ) );
#! false
IsWellDefined( EvaluationMorphism( C, A ) );
#! true
IsIsomorphism( EvaluationMorphism( C, A ) );
#! false
IsWellDefined( CoevaluationMorphism( A, D ) );
#! true
IsIsomorphism( CoevaluationMorphism( A, D ) );
#! false
IsWellDefined( CoevaluationMorphism( D, A ) );
#! true
IsIsomorphism( CoevaluationMorphism( D, A ) );
#! false
th := UniqueMorphism( TensorProduct( A, C ), C );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( th );
#! true
th := TensorProductToInternalHomAdjunctionMap( A, C, th );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( th );
#! true
IsIsomorphism( th );
#! false
ht := UniqueMorphism( A, InternalHomOnObjects( D, B ) );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( ht );
#! true
ht := InternalHomToTensorProductAdjunctionMap( D, B, ht );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( ht );
#! true
IsIsomorphism( ht );
#! false
IsWellDefined( MonoidalPreComposeMorphism( A, C, D ) );
#! true
IsIsomorphism( MonoidalPreComposeMorphism( A, C, D ) );
#! false
#! @EndExample
