module Main where

import Data.Aeson (parseJSON, ToJSON, FromJSON, object, (.=))
import Data.Text (Text)
import qualified Data.Text as T
import Data.Maybe (fromMaybe)

-- | A simple data type representing a configuration field
data Field = Field
  { fieldName :: Text
  , fieldType :: Text
  , fieldDefault :: Maybe Text
  } deriving (Show)

-- | Generate a configuration boilerplate from a list of fields
generateBoilerplate :: [Field] -> Text

 generateBoilerplate fields = T.unlines $ map formatField fields

  where
    formatField :: Field -> Text
    formatField field =
      let name = fieldName field
          typ = fieldType field
          def = fromMaybe "null" (fieldDefault field)
      in T.pack $ "" ++ T.unpack name ++ " :: " ++ T.unpack typ ++ " -- default: " ++ T.unpack def

-- | Simple parse JSON (for demonstration)
parseFields :: Text -> [Field]
parseFields _ =
  [ Field "db_host" "String" (Just "localhost")
  , Field "db_port" "Int" (Just "5432")
  , Field "debug" "Bool" (Just "False")
  ]

main :: IO ()
main = do
  putStrLn "Config Boilerplate Generator"
  let fields = parseFields "schema"
  putStrLn $ generateBoilerplate fields
