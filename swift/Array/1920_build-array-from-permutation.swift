 // https://leetcode.com/problems/build-array-from-permutation/
class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        return nums.map {nums[$0]}
    }
}