// https://leetcode.com/problems/similar-rgb-color/
class Solution {
    func similarRGB(_ color: String) -> String {
        let colorChars = [Character](color)
        let r = Int("\(colorChars[1])\(colorChars[2])",radix: 16)!
        let g = Int("\(colorChars[3])\(colorChars[4])",radix: 16)!
        let b = Int("\(colorChars[5])\(colorChars[6])",radix: 16)!
        let a = r / 17
        let rr = abs(a * 17 - r) < abs((a + 1) * 17 - r) ? a  : (a + 1)
        let c = g / 17
        let gg = abs(c * 17 - g) < abs((c + 1) * 17 - g) ? c : (c + 1)
        let d = b / 17
        let bb = abs(d * 17 - b) < abs((d + 1) * 17 - b) ? d : (d + 1)
        
        return "#\(String(rr,radix: 16))\(String(gg,radix: 16))\(String(bb,radix: 16))"
    }
}