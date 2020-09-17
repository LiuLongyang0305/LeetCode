// https://leetcode.com/problems/missing-ranges/
class Solution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        guard lower != upper else {
            return nums.isEmpty ? ["\(lower)"] : []
        }
        guard !nums.isEmpty else {
            return ["\(lower)->\(upper)"]
        }
        var ans = [String]()
        if lower < nums[0] {
            let right = nums[0] - 1
            ans.append(right == lower ? "\(lower)" : "\(lower)->\(right)")
        }
        let N = nums.count
        for i in 0..<(N - 1) {
            let left = nums[i] + 1
            let right = nums[i + 1] - 1
            if right >= left {
                ans.append(left == right ? "\(right)" : "\(left)->\(right)")
            }
        }
        if upper > nums[N - 1] {
            let left = nums[N - 1] + 1
            ans.append(left == upper ? "\(left)" : "\(left)->\(upper)")
        }
        return ans
    }
}
