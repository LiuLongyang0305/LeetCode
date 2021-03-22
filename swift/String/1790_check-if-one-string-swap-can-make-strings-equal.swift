// https://leetcode.com/problems/check-if-one-string-swap-can-make-strings-equal/
class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        guard s1 != s2 else {
            return true
        }
        let s1Chars = [Character](s1)
        let s2Chars = [Character](s2)
        let N = s1.count
        var first: Int? = nil
        var second: Int? = nil
        for i in 0..<N {
            if s1Chars[i] != s2Chars[i] {
                guard nil == second else {
                    return false
                }
                if nil == first {
                    first = i
                } else {
                    second = i
                }
            }
        }
        guard let f = first, let s = second else {
            return false
        }
        return  s1Chars[f] == s2Chars[s] && s1Chars[s] == s2Chars[f]
    }
}

