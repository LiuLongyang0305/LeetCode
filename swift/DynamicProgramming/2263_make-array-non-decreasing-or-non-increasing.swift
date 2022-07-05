// https://leetcode.com/problems/make-array-non-decreasing-or-non-increasing/
class Solution {
    func convertArray(_ nums: [Int]) -> Int {
        return min(makeArrayNonDreasing(nums), makeArrayNonDreasing(nums.reversed()))
    }


    private func makeArrayNonDreasing(_ nums: [Int]) -> Int {
        var last = (0...1000).map { abs(nums[0] - $0)}
        let M = nums.count
        var j = 1
        while j < M {
            var cur = [Int](repeating: 1000000000, count: 10001)
            var preMin = Int.max
            for k in 0...1000 {
                preMin = min(preMin, last[k])
                cur[k] = abs(nums[j] - k) + preMin
            }
            j += 1
            last = cur
        }

        return last.min()!
    }
}