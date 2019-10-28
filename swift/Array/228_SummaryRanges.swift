//https://leetcode.com/problems/summary-ranges/
class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else {
            return []
        }
        guard nums.count > 1 else {
            return ["\(nums[0])"]
        }
        var ans = [String]()
        var i = 0
        var j = 1
        
        while j < nums.count {
            while j < nums.count && nums[j] - nums[j - 1] == 1 {
                j  += 1
            }
            if (j - 1 - i == 0) {
                ans.append("\(nums[i])")
            } else {
                ans.append("\(nums[i])->\(nums[j - 1])")
            }
            i = j
            j += 1
        }
        if i < nums.count {
            if (j - 1 - i == 0) {
                ans.append("\(nums[i])")
            } else {
                ans.append("\(nums[i])->\(nums[j - 1])")
            }
        }
        return ans
    }
}