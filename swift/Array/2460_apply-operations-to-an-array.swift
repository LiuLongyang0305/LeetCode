 // https://leetcode.com/problems/apply-operations-to-an-array/
class Solution {
    func applyOperations(_ nums: [Int]) -> [Int] {
        var copy = nums
        let N = nums.count
        for i in 0..<(N - 1) {
            if copy[i] == copy[i + 1] {
                copy[i] *= 2
                copy[i + 1] = 0
            }
        }
        var ans = copy.filter { $0 != 0}
        if ans.count < N {
            ans.append(contentsOf: [Int](repeating: 0, count: N - ans.count))
        }
        return ans
    }
}