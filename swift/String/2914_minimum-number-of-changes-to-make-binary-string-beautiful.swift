 //https://leetcode.cn/problems/minimum-number-of-changes-to-make-binary-string-beautiful/
    class Solution {
        func minChanges(_ s: String) -> Int {
            guard s.count & 1 == 0 else {return -1}
            var first = s.startIndex
            var second = s.index(after: first)
            var ans = 0
            while second < s.endIndex {
                if s[second] != s[first] {
                    ans += 1
                }
                first = s.index(after: second)
                if first < s.endIndex {
                    second = s.index(after: first)
                } else {
                    second = s.endIndex
                }
            }
            return ans
        }
    }