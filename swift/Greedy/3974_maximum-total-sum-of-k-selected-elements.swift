// https://leetcode.cn/problems/maximum-total-sum-of-k-selected-elements/
class Solution {
    func maxSum(_ nums: [Int], _ k: Int, _ mul: Int) -> Int {
        let sortedNums = nums.sorted {$0 > $1}
        var t = mul
        var sb = 0
        for i in 0..<k {
            sb += (t > 1 ? t : 1) * sortedNums[i]
            t -= 1
        }
        return sb
    }
}
