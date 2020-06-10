//https://leetcode-cn.com/problems/que-shi-de-shu-zi-lcof/
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let N = nums.count
        return nums.reduce((0...N).reduce(0) {$0 ^ $1}) {$0 ^ $1}
    }
}