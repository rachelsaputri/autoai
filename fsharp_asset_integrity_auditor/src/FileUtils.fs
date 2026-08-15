namespace AssetIntegrityAuditor

open System.IO

module FileUtils =

    let getAllFiles (rootDir: string) : string[] =
        let dirs = Directory.GetDirectories(rootDir, "*", SearchOption.AllDirectories)
        let files = Directory.GetFiles(rootDir, "*", SearchOption.AllDirectories)
        Array.append files dirs

    let getDirectoryInfo (path: string) : DirectoryInfo option =
        if Directory.Exists(path) then
            Some(DirectoryInfo(path))
        else
            None

    let getFileHash (filePath: string) : string =
        use stream = File.OpenRead(filePath)
        let sha256 = System.Security.Cryptography.SHA256.Create()
        let hash = sha256.ComputeHash(stream)
        BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant()
