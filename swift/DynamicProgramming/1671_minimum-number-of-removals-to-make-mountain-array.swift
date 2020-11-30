// https://leetcode.com/problems/minimum-number-of-removals-to-make-mountain-array/
class Solution {
    func minimumMountainRemovals(_ nums: [Int]) -> Int {
        let N = nums.count
        var dp1 = Array<Int>(repeating: 1, count: N)
        var dp2 = Array<Int>(repeating: 1, count: N)
        for i in 1..<N {
            var ans = 1
            for j in 0..<i {
                if nums[j] < nums[i] {
                    ans = max(ans, 1 + dp1[j])
                }
            }
            if ans != 1 {
                dp1[i] = ans
            }
        }
        for i in stride(from: N - 2, through: 0, by: -1) {
            var ans = 1
            for j in (i + 1)..<N {
                if nums[j] < nums[i] {
                    ans = max(ans, 1 + dp2[j])
                }
            }
            if ans != 1 {
                dp2[i] = ans
            }
        }
        var ans = Int.max
        for idx in 1..<(N - 1) {
            let length = dp1[idx] + dp2[idx] - 1
            guard length >= 3 else {
                continue
            }
            ans = min(ans, N - length)
        }
        return ans
    }
}

