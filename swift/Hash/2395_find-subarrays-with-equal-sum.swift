//  https://leetcode.com/problems/find-subarrays-with-equal-sum/
class Solution {
    func findSubarrays(_ nums: [Int]) -> Bool {
        let N = nums.count
        var set = Set<Int>()
        for i in 1..<N {
            let t = nums[i] + nums[i - 1]
            guard !set.contains(t) else {
                return true
            }
            set.insert(t)
        }
        return false
    }
}