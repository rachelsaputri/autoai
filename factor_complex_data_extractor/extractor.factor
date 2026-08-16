USING: accessors kernel math math.statistics sequences sequences.private io io.encodings.ascii io.files strings tokenizer parser.parser io.encodings.utf8 ;
IN: data-extractor

TUPLE: record fields ;

: safe-string ( str -- str )
    over blank? [ "" ] [ nip ] if* ;

: parse-tsv ( str -- seq )
    "\t" tokenizer seq-map safe-string ;

: parse-csv ( str -- seq )
    "," tokenizer seq-map safe-string ;

: infer-number ( str -- obj )
    "." over member? 
    [ nip parse-double ]
    [ "." over member? not [ nip parse-int ] if* ] if* ;

: safe-infer ( str -- obj )
    safe-string infer-number ;

: parse-row ( seq -- record )
    record boa ;

: extract-fields ( seq -- fields )
    H{ } clone 
    swap [ 
        dup integer? [ 2mod [ H. ] [ 1+ ] bi* ] [ drop ] if* 
    ] each 2drop ;

: parse-data ( seq -- fields records )
    [ 0 <throttle> parse-tsv ] if* ;

: parse-rows ( str -- seq )
    "\n" partition seq-map parse-row ;

: extract-data ( str -- fields records )
    parse-rows extract-fields ;

: safe-numeric-list ( seq -- list )
    [ safe-infer ] map ;

: compute-mean ( seq -- num )
    safe-numeric-list mean ;

: compute-median ( seq -- num )
    safe-numeric-list median ;

: parse-json ( str -- obj )
    utf8 decode parse-json ;

: run-extraction ( str -- )
    extract-data 
    dup [ compute-mean ] [ compute-median ] bi print ;

MAIN: run-extraction
