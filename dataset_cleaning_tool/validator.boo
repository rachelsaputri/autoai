import System

class DataValidator:
    def Constructor():
        pass

    def ValidateLine(line as string) as bool:
        if string.IsNullOrEmpty(line):
            return False
        
        fields as array of string = line.Split(",")
        if fields.Length < 2:
            return False
            
        for field as string in fields:
            if not _IsWellFormed(field.Trim()):
                return False
                
        return True

    private def _IsWellFormed(input as string) as bool:
        if string.IsNullOrEmpty(input):
            return False
        
        try:
            int.Parse(input)
            return True
        except:
            pass
            
        try:
            double.Parse(input)
            return True
        except:
            pass
            
        return input.Length > 0 and input.Length < 256
