// https://leetcode.com/problems/minimum-insertions-to-balance-a-parentheses-string/
class Solution {
    func minInsertions(_ s: String) -> Int {
        var ans = 0
        var leftCnt = 0
        var rightCnt = 0
        for ch in s {
            if ch == "(" {
                leftCnt += 1
                if rightCnt != 0 {
                    ans += 1
                    leftCnt -= 1
                    rightCnt = 0
                }
            } else {
                if leftCnt == 0 {
                    leftCnt += 1
                    ans += 1
                }
                rightCnt += 1
                if rightCnt == 2 {
                    if leftCnt > 0 {
                        leftCnt -= 1
                    } else {
                        ans += 1
                    }
                    rightCnt = 0
                }
            }
        }
        ans += (leftCnt << 1 - rightCnt)
        return ans
    }
}

