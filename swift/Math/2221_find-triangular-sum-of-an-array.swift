// https://leetcode.com/problems/find-triangular-sum-of-an-array/
class Solution {
    func triangularSum(_ nums: [Int]) -> Int {

        var curNums = nums
        while curNums.count > 1 {
            let N = curNums.count
            let newNums = (0...(N - 2)).map { (curNums[$0] + curNums[$0 + 1]) % 10}
            curNums = newNums
        }
        return curNums[0]
    }
}
