import System
import System.Text.RegularExpressions

class TextNormalizer:
    private _whitespacePattern as Regex = Regex("\\s+", RegexOptions.Compiled)

    def NormalizeLine(line as string, steps as array of string) as string:
        result as string = line
        
        if "whitespace_normalizer" in steps:
            result = _whitespacePattern.Replace(result, " ").Trim()
            
        if "character_cleaner" in steps:
            result = _CleanCharacters(result)
            
        return result

    private def _CleanCharacters(input as string) as string:
        sb as System.Text.StringBuilder = System.Text.StringBuilder()
        for c as char in input:
            if char >= 32 and char <= 126 or char in [9, 10, 13]:
                sb.Append(c)
        return sb.ToString()

    def FormatText(text as string) as string:
        return text.ToLower().Replace("  ", " ").Trim()
