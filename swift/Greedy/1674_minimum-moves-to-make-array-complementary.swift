// https://leetcode.com/problems/minimum-moves-to-make-array-complementary/
class Solution {
    func minMoves(_ nums: [Int], _ limit: Int) -> Int {
        let N = nums.count
        var times = Array<Int>(repeating: 0, count: 2 * limit + 2)
        for idx in 0..<(N >> 1) {
            let a = nums[idx]
            let b = nums[N - 1 - idx]
            times[2] += 2
            times[2 * limit + 1] -= 2
            times[1 + min(a, b)] += -1
            times[limit + max(a, b) + 1] -= -1
            times[a + b] += -1
            times[a + b + 1] -= -1
        }
        var ans = N
        var sum = 0
        for idx in 2...(limit * 2) {
            sum += times[idx]
            if  sum < ans {
                ans = sum
            }
        }
        return ans
    }
}