    // https://leetcode.cn/problems/binary-digit-score
    class Solution {
        func calculateScore(_ a: Int, _ b: Int) -> Int {
            let sa = a.nonzeroBitCount
            let sb = b.nonzeroBitCount
            return sa >= sb ? (sa * sb) : (sb / sa)
        }
    }
