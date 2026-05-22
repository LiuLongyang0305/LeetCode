//https://leetcode.cn/problems/concatenate-array-with-reverse/
class Solution {
    func concatWithReverse(_ nums: [Int]) -> [Int] {
        return nums + [Int](nums.reversed())
    }
}
