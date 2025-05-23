# $Id: //dvt/mti/rel/2020.3_oct_lattice/src/misc/perl_src/XML/SAX/PurePerl/UnicodeExt.pm#1 $

package XML::SAX::PurePerl;
use strict;

no warnings 'utf8';

sub chr_ref {
    return chr(shift);
}

if ($] >= 5.007002) {
    require Encode;
    
    Encode::define_alias( "UTF-16" => "UCS-2" );
    Encode::define_alias( "UTF-16BE" => "UCS-2" );
    Encode::define_alias( "UTF-16LE" => "ucs-2le" );
    Encode::define_alias( "UTF16LE" => "ucs-2le" );
}

1;

