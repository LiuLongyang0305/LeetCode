// https://leetcode.cn/problems/bitwise-or-of-all-subsequence-sums/
class Solution {
    func subsequenceSumOr(_ nums: [Int]) -> Int {
        var digitCnt = [Int](repeating: 0, count: 64)
        for  num in nums {
            for i in 0..<32 {
                if num & (1 << i) != 0 {
                    digitCnt[i] += 1
                }
            }
        }
        var cur = 1
        var res = 0
        for i in 0...50{
            if digitCnt[i] > 0 {
                res += cur
            }
            cur *= 2
            digitCnt[i + 1] += digitCnt[i] / 2
        }
        return res
    }
}
