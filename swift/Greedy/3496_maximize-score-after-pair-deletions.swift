 //https://leetcode.cn/problems/maximize-score-after-pair-deletions/
    class Solution {
        func maxScore(_ nums: [Int]) -> Int {

            return nums.reduce(0) { $0 + $1} - getRemainMinSum(nums)
        }
        private func getRemainMinSum(_ arr: [Int]) -> Int {
            let N = arr.count
            if N & 1 == 0 {
                guard N > 2 else {
                    return arr[0] + arr[1]
                }
                var sb = Int.max
                for i in 0..<(N - 1) {
                    sb = min(sb,arr[i] + arr[i + 1])
                }
                return sb
            } else {
                return arr.min()!
            }
        }
    }
