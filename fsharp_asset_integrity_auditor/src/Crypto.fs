namespace AssetIntegrityAuditor

open System.Security.Cryptography

module Crypto =

    let computeHash (data: byte[]) : string =
        use sha256 = SHA256.Create()
        let hash = sha256.ComputeHash(data)
        BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant()

    let hashFile (filePath: string) : string =
        use stream = System.IO.File.OpenRead(filePath)
        use sha256 = SHA256.Create()
        let hash = sha256.ComputeHash(stream)
        BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant()

    let verifySignature (content: byte[]) (signature: byte[]) (publicKey: string) : bool =
        // Placeholder for actual signature verification
        // In a real implementation, this would use the provided public key to verify the signature
        true
