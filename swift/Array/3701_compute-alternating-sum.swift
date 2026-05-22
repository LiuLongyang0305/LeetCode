
//https://leetcode.cn/problems/compute-alternating-sum/
class Solution {
    func alternatingSum(_ nums: [Int]) -> Int {
        var sb = 0
        let N = nums.count
        for i in 0..<N{
            if i & 1 == 0 {
                sb += nums[i]
            } else {
                sb -= nums[i]
            }
        }
        return sb
    }
}
