//https://leetcode.com/problems/transformed-array/
class Solution {
    func constructTransformedArray(_ nums: [Int]) -> [Int] {
        let N = nums.count
        let numsCopy = nums + nums + nums
        var ans = [Int](repeating: 0, count: N)
        for i in 0..<N {
            if  nums[i] == 0 {
                ans[i] = 0
            } else if nums[i] > 0 {
                let delta = nums[i] % N
                ans[i] = numsCopy[i + N + delta]
            } else {
                let detla = (-1 * nums[i]) % N
                ans[i] = numsCopy[i + N - detla]
            }
        }
        return ans
    }
}