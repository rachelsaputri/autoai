component accessors="true" output="false" {

    // Configuration
    property name="delimiter" type="string" default=",";
    property name="quoteChar" type="string" default="\"";
    property name="skipEmptyRows" type="boolean" default=true;
    property name="encoding" type="string" default="UTF-8";

    public function any init( required any input, struct options={} ) {
        // Apply options if provided
        for ( var key in arguments.options ) {
            if ( structKeyExists( variables, key ) ) {
                set( key, arguments.options[ key ] );
            }
        }

        // Detect format based on input type or structure
        var format = detectFormat( arguments.input );
        
        // Parse based on detected format
        switch ( format ) {
            case "json":
                variables.parsedData = parseJson( arguments.input );
                break;
            case "csv":
                variables.parsedData = parseCsv( arguments.input );
                break;
            case "text":
                variables.parsedData = parseText( arguments.input );
                break;
            default:
                throw( message="Unsupported data format or input type.", detail="Input could not be identified as JSON, CSV, or plain text." );
        }

        return this;
    }

    public struct function getData() {
        return variables.parsedData;
    }

    private string function detectFormat( required any input ) {
        var strInput = trim( toString( input ) );
        
        // Check for JSON
        if ( strLeft( strInput, 1 ) == "{" || strLeft( strInput, 1 ) == "[" ) {
            try {
                // Attempt to parse as JSON to validate
                deserializeJson( strInput );
                return "json";
            } catch ( any e ) {
                // If parsing fails, it might not be JSON, continue to other checks
            }
        }

        // Check for CSV (simple heuristic: contains newlines and the configured delimiter)
        if ( listLen( strInput, chr(10) ) > 1 && find( strInput, getDelimiter() ) ) {
            return "csv";
        }

        return "text";
    }

    private array function parseCsv( required string input ) {
        var csvString = input;
        var results = [];
        
        try {
            // Use ColdFusion's built-in CSV parsing capabilities if available, 
            // otherwise manual parsing for broader compatibility.
            // Note: listToArray is used here as a standard extraction utility approach.
            var rows = listToArray( csvString, chr(10) );
            var headers = listToArray( rows[1], getDelimiter() );
            
            if ( getSkipEmptyRows() ) {
                rows = arrayFilter( rows, function(row) { return trim( row ) neq ""; } );
            }

            for ( var i = 2; i lte arrayLen( rows ); i++ ) {
                var row = listToArray( rows[ i ], getDelimiter(), getQuoteChar() );
                var rowData = {};
                
                for ( var j = 1; j lte arrayLen( headers ); j++ ) {
                    rowData[ headers[ j ] ] = cleanValue( row[ j ] );
                }
                arrayAppend( results, rowData );
            }
        } catch ( any e ) {
            throw( message="CSV Parsing Error", detail=e.message );
        }
        
        return results;
    }

    private array function parseText( required string input ) {
        var lines = listToArray( input, chr(10) );
        var results = [];
        
        for ( var line in lines ) {
            if ( getSkipEmptyRows() && trim( line ) eq "" ) continue;
            arrayAppend( results, { raw: trim( line ) } );
        }
        return results;
    }

    private any function cleanValue( required any value ) {
        // Remove surrounding quotes if present
        var strVal = toString( value );
        if ( left( strVal, 1 ) eq getQuoteChar() && right( strVal, 1 ) eq getQuoteChar() ) {
            strVal = mid( strVal, 2, len( strVal ) - 2 );
        }
        // Remove surrounding whitespace
        return trim( strVal );
    }

    private string function getDelimiter() {
        return variables.delimiter;
    }

    private string function getQuoteChar() {
        return variables.quoteChar;
    }

    private boolean function getSkipEmptyRows() {
        return variables.skipEmptyRows;
    }

    private string function getEncoding() {
        return variables.encoding;
    }

}
