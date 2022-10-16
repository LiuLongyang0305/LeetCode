// https://leetcode.com/problems/minimize-maximum-of-array/
class Solution {
    func minimizeArrayValue(_ nums: [Int]) -> Int {

        let N = nums.count

        func check(_ target: Int) -> Bool {
            var copy = nums
            for i in stride(from: N - 1, to: 0, by: -1) {
                if copy[i] > target {
                    let diff = copy[i] - target
                    copy[i - 1] += diff
                }
            }
            return copy[0] <= target
        }
        var left = 0
        var right = 1_000_000_000
        while left < right {
            let mid = (left + right ) / 2
            if check(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}