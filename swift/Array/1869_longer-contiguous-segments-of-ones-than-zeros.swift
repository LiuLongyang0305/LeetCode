// https://leetcode.com/problems/longer-contiguous-segments-of-ones-than-zeros/
class Solution {
    func checkZeroOnes(_ s: String) -> Bool {
        var ones = 0
        var zeros = 0
        var idx = s.startIndex
        while idx < s.endIndex {
            var idx2 = idx
            while idx2 < s.endIndex && s[idx2] == s[idx] {
                idx2 = s.index(after: idx2)
            }
            let cnt = s.distance(from: idx, to: idx2)
            if s[idx] == "1" {
                if ones < cnt {
                    ones = cnt
                }
            } else {
                if zeros < cnt {
                    zeros = cnt
                }
            }
            idx = idx2
        }
        
        return ones > zeros
    }
}

