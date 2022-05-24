// https://leetcode.com/problems/preimage-size-of-factorial-zeroes-function/
class Solution {
    func preimageSizeFZF(_ k: Int) -> Int {

        var left = 0
        var right = 10000000000


        while left < right {
            let mid = (left + right) >> 1
            if trailingZeros(of: mid) < k {
                left = mid + 1
            } else {
                right = mid
            }
        }

        guard trailingZeros(of: left) == k else {return 0}
        var ans = 0
        for delta in 0..<5 {
            if trailingZeros(of: delta + left) == k {
                ans += 1
            }
        }

        return ans
    }


    private func trailingZeros(of num: Int) -> Int {
        if num < 5 {
            return 0
        } else {
            return num / 5 + trailingZeros(of: num / 5)
        }
    }
}