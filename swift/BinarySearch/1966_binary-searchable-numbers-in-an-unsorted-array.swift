//https://leetcode.com/problems/1/
class Solution {
    
    func binarySearchableNumbers(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {return nums.count}
        let N = nums.count
        var preffix = nums
        var suffix = nums
        for i in 1..<N {
            preffix[i] = max(preffix[i - 1], nums[i])
        }
        for i in stride(from: N - 2, through: 0, by: -1) {
            suffix[i] = min(nums[i], suffix[i + 1])
        }
        var cnt = 0
        for i in 0..<N{
            if suffix[i] == preffix[i] {
                cnt += 1
            }
        }
        return cnt
    }
}