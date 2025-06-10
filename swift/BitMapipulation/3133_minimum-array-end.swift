//https://leetcode.com/problems/minimum-array-end/
class Solution {
    func minEnd(_ n: Int, _ x: Int) -> Int {
        var terget = n - 1
        var ans = x

        let digitsCnt = 64 - x.leadingZeroBitCount

        for i in 0..<digitsCnt {
            if x & (1 << i) == 0 {
                if terget & 1 == 1 {
                    ans = ans | (1 << i)
                }
                terget /= 2
            }
        }

        var j = digitsCnt
        while terget > 0 {
            if terget & 1 == 1 {
                ans |= (1 << j)
            }
            terget /= 2
            j += 1
        }

        return ans
    }
}

