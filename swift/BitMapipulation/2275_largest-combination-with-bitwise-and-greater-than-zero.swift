// https://leetcode.com/problems/largest-combination-with-bitwise-and-greater-than-zero/
class Solution {
    func largestCombination(_ candidates: [Int]) -> Int {
        var ans = 0
        for i in 0...24 {
            var cnt = 0
            let mask = 1 << i
            for c in candidates {
                if (c & mask != 0) {
                    cnt += 1
                }
            }
            ans = max(ans, cnt)
        }


        return ans
    }
}