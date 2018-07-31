#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

##
InstallMethod( ZariskiClosedSubsetOfAffineSpectrum,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            MorphismOfUnderlyingCategory, I,
            UnderlyingRing, R
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ZariskiClosedSubsetOfAffineSpectrum,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return ZariskiClosedSubsetOfAffineSpectrum( AsCategoryOfRowsMorphism( mat ) );
    
end );

##
InstallMethod( ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiCoframe;
    
    name := "The coframe of Zariski closed subsets of the affine spectrum of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiCoframe := CreateCapCategory( name );
    
    ZariskiCoframe!.UnderlyingCategory := CategoryOfRows( R );
    
    AddObjectRepresentation( ZariskiCoframe, IsObjectInZariskiCoframe );
    
    AddMorphismRepresentation( ZariskiCoframe, IsMorphismInZariskiCoframe );
    
    ##
    AddIsWellDefinedForObjects( ZariskiCoframe,
      function( A )
        
        A := MorphismOfUnderlyingCategory( A );
        
        if not RankOfObject( Range( A ) ) = 1 then
            return false;
        fi;
        
        return IsWellDefined( A );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( ZariskiCoframe,
      function( emb )
        local S, T;
        
        S := MorphismOfUnderlyingCategory( Source( emb ) );
        T := MorphismOfUnderlyingCategory( Range( emb ) );
        
        return not Lift( T, S ) = fail;
        
    end );
    
    ##
    AddIsEqualForObjects( ZariskiCoframe,
      function( A, B )
        
        A := MorphismOfUnderlyingCategory( A );
        B := MorphismOfUnderlyingCategory( B );
        
        if Lift( A, B ) = fail then
            return false;
        fi;
        
        return not Lift( B, A ) = fail;
        
    end );
    
    ADD_COMMON_METHODS_FOR_ZARISKI_COFRAMES( ZariskiCoframe );
    
    Finalize( ZariskiCoframe );
    
    return ZariskiCoframe;
    
end );

##
InstallMethod( Display,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],

  function( A )
    
    Display( MorphismOfUnderlyingCategory( A ) );
    
end );