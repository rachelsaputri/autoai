module extractor where

open import Data.List
open import Data.String
open import Data.Nat
open import Relation.Nullable
open import Relation.Binary.PropositionalEquality

-- Simple record for an extracted log entry
record LogEntry {
  timestamp : String
  level     : String
  message   : String
}

-- Parser function that splits a log line (mocked for structure)
parseLogLine : String → Maybe LogEntry
parseLogLine s = if null s then nothing else 
  just (record { timestamp = "now" ; level = "INFO" ; message = s })

-- Main extraction function
extractLogs : List String → List LogEntry
extractLogs = mapMaybe parseLogLine
