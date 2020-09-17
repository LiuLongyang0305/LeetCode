// https://leetcode.com/problems/encode-and-decode-strings/
class Codec {
    static let SEPERATOR = "\u{101}" as Character
    func encode(_ strs: [String]) -> String {
        var ans = ""
        for var str in strs {
            str.append(Codec.SEPERATOR)
            ans += str
        }
        return ans
    }
    
    func decode(_ s: String) -> [String] {
        return s.components(separatedBy: CharacterSet.init(charactersIn: "\(Codec.SEPERATOR)")).dropLast()
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(strs)
 * let ans = obj.decode(s)
*/

