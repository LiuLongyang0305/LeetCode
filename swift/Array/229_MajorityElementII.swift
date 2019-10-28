//https://leetcode.com/problems/majority-element-ii/
class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {

        var ans = [0,0]
        var count = [0,0]
        for i in 0..<nums.count {
            if nums[i] == ans[0] {
                count[0] += 1
            } else if nums[i] == ans[1] {
                count[1] += 1
            } else if count[0] == 0 {
                ans[0] = nums[i]
                count[0] = 1
            } else if count[1] == 0 {
                ans[1] = nums[i]
                count[1] = 1
            } else {
                count[0] -= 1
                count[1] -= 1
            }
        }
        guard ans.count == 2 else {
            return ans
        }
        count[1] = 0
        count[0] = 0
        for num in nums {
            if num == ans[0] {
                count[0] += 1
            } else  if num == ans[1] {
                count[1] += 1
            }
        }
        var rel = [Int]()
        if count[0] > nums.count / 3 {
            rel.append(ans[0])
        }
        if count[1] > nums.count / 3 {
            rel.append(ans[1])
        }
        return rel
    }
}