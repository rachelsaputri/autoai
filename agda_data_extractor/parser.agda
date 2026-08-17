module parser where

open import Agda.Builtin.Char using (Char; _∷_
; []
open import Agda.Builtin.List using (List; _∷_; []; map; foldr; length; concat; take; drop)
open import Agda.Builtin.Nat using (ℕ; zero; suc; _+_; _*_; _≤_; z≤_; s≤s)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)

-- ==========================================
-- Token Definitions
-- ==========================================

data Token : Set where
  T-Word : List Char → Token
  T-Symbol : Char → Token

-- ==========================================
-- Lexer (Tokenizer)
-- ==========================================

isWhitespace : Char → Bool
isWhitespace c = c ' ' ∨ c '\t' ∨ c '\n' ∨ c '\r'

isIdentChar : Char → Bool
isIdentChar c =
  (c 'a' ∨ c 'b' ∨ c 'c' ∨ c 'd' ∨ c 'e' ∨ c 'f' ∨ c 'g' ∨ c 'h' ∨ c 'i' ∨ c 'j' ∨ c 'k' ∨ c 'l' ∨ c 'm' ∨ c 'n' ∨ c 'o' ∨ c 'p' ∨ c 'q' ∨ c 'r' ∨ c 's' ∨ c 't' ∨ c 'u' ∨ c 'v' ∨ c 'w' ∨ c 'x' ∨ c 'y' ∨ c 'z' ∨
   c 'A' ∨ c 'B' ∨ c 'C' ∨ c 'D' ∨ c 'E' ∨ c 'F' ∨ c 'G' ∨ c 'H' ∨ c 'I' ∨ c 'J' ∨ c 'K' ∨ c 'L' ∨ c 'M' ∨ c 'N' ∨ c 'O' ∨ c 'P' ∨ c 'Q' ∨ c 'R' ∨ c 'S' ∨ c 'T' ∨ c 'U' ∨ c 'V' ∨ c 'W' ∨ c 'X' ∨ c 'Y' ∨ c 'Z' ∨
   c '0' ∨ c '1' ∨ c '2' ∨ c '3' ∨ c '4' ∨ c '5' ∨ c '6' ∨ c '7' ∨ c '8' ∨ c '9' ∨
   c '_')

lex : List Char → List Token
lex [] = []
lex (c ∷ cs) =
  if isWhitespace c then
    lex cs
  else if isIdentChar c then
    let (word, rest) = extractWord (c ∷ cs)
    in T-Word word ∷ lex rest
  else
    T-Symbol c ∷ lex cs

extractWord : List Char → List (List Char)
extractWord [] = ([] ∷ [])
extractWord (c ∷ cs) =
  if isIdentChar c then
    let (word, rest) = extractWord cs
    in (c ∷ word) ∷ rest
  else
    ([] ∷ cs)

-- ==========================================
-- Parser (Token to AST/Fields)
-- ==========================================

record Field : Set where
  constructor mkField
  fieldName : List Char
  fieldValue : List Char
  open Field

parseTokens : List Token → List Field
parseTokens [] = []
parseTokens (T-Word name ∷ T-Word value ∷ ts) =
  mkField name value ∷ parseTokens ts
parseTokens _ = []

-- ==========================================
-- Utility: Reverse a list
-- ==========================================

reverse : List Char → List Char
reverse [] = []
reverse (x ∷ xs) = reverse xs ∷ x
