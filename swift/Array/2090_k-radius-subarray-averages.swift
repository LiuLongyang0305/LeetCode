// https://leetcode.com/problems/k-radius-subarray-averages/
class Solution {
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        let N = nums.count
        var preffix = [Int](repeating: 0, count: N + 1)
        for i in 1...N {
            preffix[i] = preffix[i - 1] + nums[i - 1]
        }
        let length = 2 * k + 1
        var ans = [Int](repeating: -1, count: N)
        // let maxPossibleIdx = N - k - 1
        // var idx = k
        // while idx <= maxPossibleIdx {
        //     ans[idx] = (preffix[idx + k + 1] - preffix[idx - k]) / length
        //     idx += 1
        // }
       for idx in 0..<N {
           let left = idx - k
           guard left >= 0 else {
               continue
           }
           let right = idx + k
           guard right < N else {
               continue
           }
           ans[idx] = (preffix[right + 1] - preffix[left]) / length
       }
        return ans
    }
}