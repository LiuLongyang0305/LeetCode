// https://leetcode.com/problems/shuffle-the-array/
class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var ans = [Int]()
        for i in 0..<n {
            ans.append(nums[i])
            ans.append(nums[i + n])
        }
        return ans
    }
}