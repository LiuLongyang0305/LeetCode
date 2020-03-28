//https://leetcode-cn.com/problems/string-rotation-lcci/
class Solution1 {
    func isFlipedString(_ s1: String, _ s2: String) -> Bool {
        guard s1.count == s2.count else {
            return false
        }
        guard s1 != s2 else {
            return  true
        }
        var length = 1
        let N = s1.count
        while length < N {
            if s1.prefix(length) == s2.suffix(length) {
                if s1.suffix(N - length) == s2.prefix(N - length) {
                    return true
                }
            }
            length += 1
        }
        return false
    }
}

class Solution {
    func isFlipedString(_ s1: String, _ s2: String) -> Bool {
        guard s1.count == s2.count else {
            return false
        }
        guard s1 != s2 else {
            return  true
        }
        return (s2 + s2).contains(s1)
    }
}
