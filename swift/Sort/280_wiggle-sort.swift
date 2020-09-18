// https://leetcode.com/problems/wiggle-sort/
class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        nums.sort()
        var i = 1
        let N = nums.count
        while i + 1 < N {
            nums.swapAt(i, i + 1)
            i += 2
        }
    }
}
