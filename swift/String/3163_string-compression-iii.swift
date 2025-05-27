//https://leetcode.cn/problems/string-compression-iii/
class Solution {
    func compressedString(_ word: String) -> String {
        var ans = ""
        let chars = [Character](word)
        var i = 0
        while i < chars.count {
            let ch = chars[i]
            var j = i
            while j < chars.count && chars[j] == ch {
                j += 1
            }
            let l = j - i
            if l <= 9 {
                ans += "\(j - i)\(ch)"
            } else {
                ans += String(repeating: "9\(ch)", count: l / 9)
                if l % 9 != 0 {
                    ans += "\(l % 9)\(ch)"
                }
                
            }

            i = j
        }
        return ans
    }
}
