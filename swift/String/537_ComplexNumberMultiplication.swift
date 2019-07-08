//https://leetcode.com/problems/complex-number-multiplication/
class Solution {
    func complexNumberMultiply(_ a: String, _ b: String) -> String {
        var ans = ""
        var aParts = a.split(separator: "+")
        var bParts = b.split(separator: "+")
        aParts[1].removeLast()
        bParts[1].removeLast()
        
        let aReal = Int(aParts[0])!
        let aImage = Int(aParts[1])!
        let bReal = Int(bParts[0])!
        let bImage = Int(bParts[1])!
        ans += "\(aReal * bReal - aImage * bImage)"
        ans += "+"
        ans += "\(aReal * bImage + aImage * bReal)i"
        return ans
    }
}