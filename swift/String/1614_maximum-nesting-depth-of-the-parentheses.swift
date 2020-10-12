// https://leetcode.com/problems/maximum-nesting-depth-of-the-parentheses/
class Solution {
    func maxDepth(_ s: String) -> Int {
        var ans = 0
        var cnt = 0
        for ch in s {
            if ch == "(" {
                cnt += 1
                ans = max(ans, cnt)
            } else if ch == ")" {
                cnt -= 1
            }
        }
        return ans
    }
}

