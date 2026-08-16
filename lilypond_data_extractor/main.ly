% LilyPond Data Extraction and Parsing Utility
% This script demonstrates complex data manipulation within LilyPond's type system.

% Define the global context for data parsing
\paper { 
  top-margin = 20
  bottom-margin = 20
  left-margin = 20
  right-margin = 20
  indent = 0
  ragged-last-bottom = ##f
}

% Global variables for configuration
#(set-global-property 'data-separator ",")
#(set-global-property 'target-field "price")

% Utility: Convert a string to a list of characters
#(define (str->list s) 
  (string->list s))

% Utility: Extract a substring based on start and length
#(define (substring* str start len) 
  (list->string (take (string->list str) start len)))

% Core Logic: Parse a single line of data
% Input: A string representing a CSV line
% Output: A list of extracted values (converted to numbers where possible)
#(define (parse-line line)
  (let* (
    (split (string-split line ","))
    (cleaned (map (lambda (x) (string-trim-both x)) split))
    (parsed (map (lambda (x) 
      (if (string->number x)
          (string->number x)
          x)) cleaned)))
    parsed))

% Core Logic: Process the dataset
% Simulating a data file internally to ensure the script runs without external dependencies
#(define (process-data)
  (let (
    (raw-data 
      "'Product A, 120.50, 10' \n"
      "'Product B, 45.25, 5' \n"
      "'Product C, 300.00, 2'")
    (lines (string-split raw-data "'\\n"))
    (records '()))
    
    (for-each 
      (lambda (line)
        (if (> (string-length line) 0)
            (set! records (append records (list (parse-line line))))))
      lines)
    
    records))

% Define a simple voice to represent a data row as a musical note
% Pitch maps to product ID, duration maps to quantity, dynamic maps to price
#(define (create-music-for-record record)
  (let (
    (product-name (car record))
    (price (cadr record))
    (quantity (caddr record)))
    
    (let (
      (pitch (if (string=? product-name "Product A") 'c 'd))
      (dur (if (= quantity 10) #(ly:make-moment 1) #(ly:make-moment 0.5))))
      
      (make-music 'PitchEvent
        'pitch (ly:make-pitch 0 0 0)
        'duration dur
        'articulations '(>)))))

% Main Score
\score { 
  <<
    \new Staff {
      \relative c'' {
        % Simulate extracting multiple records and creating music
        % Product A (Quantity 10) -> Whole note
        c1 \dynamic *> 
        % Product B (Quantity 5) -> Half note
        d2 
        % Product C (Quantity 2) -> Quarter note
        b4 
      }
    }
  >>
  \layout { }
  \midi { }
}
