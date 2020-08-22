// https://leetcode.com/problems/check-if-all-1s-are-at-least-length-k-places-away/
class Solution {
    func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
        var lastIndex = -1
        for i in 0..<nums.count {
            if nums[i] == 1 {
                if lastIndex != -1 {
                    guard i - lastIndex - 1 >= k else {
                        return false
                    }
                }
                lastIndex = i
            }
        }
        return true
    }
}