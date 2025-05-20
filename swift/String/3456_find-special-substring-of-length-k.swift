//https://leetcode.com/problems/find-special-substring-of-length-k/
import RegexBuilder

class Solution {
    func hasSpecialSubstring(_ s: String, _ k: Int) -> Bool {

        let set = Set<Character>(s)
        for ch in set {
            let regex = Regex {String(repeating: ch, count: k)}
            let matches = s.matches(of: regex)
            for sub in matches {
                let from = sub.startIndex
                let to = s.index(before: sub.endIndex)

                let flag = from == s.startIndex ? true : ch != s[s.index(before: from)]
                let flag2 = to == s.index(before: s.endIndex) ? true : ch != s[s.index(after: to)]
                if flag && flag2 {
                    return true
                }
            }
        }
        return false
    }
}