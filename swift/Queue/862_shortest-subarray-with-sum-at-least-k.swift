// https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k/
// https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k/
class Solution {
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        var  ans = Int.max
        let N = nums.count
        var preffix = [0]
        nums.forEach { preffix.append(preffix.last! + $0)}
        var queue = [0]
        for i in 1...N {

            var j = 0
            while j < queue.count && preffix[queue[j]] + k <= preffix[i] {
                ans = min(ans, i - queue[j])
                j += 1
            }
            var k = queue.count - 1
            while k >= 0 && preffix[queue[k]] >= preffix[i] {
                k -= 1
            }
            if j <= k {
                queue = queue[j...k] + [i]
            } else {
                queue = [i]
            }

        }
        return ans == Int.max ? -1 : ans
    }
}