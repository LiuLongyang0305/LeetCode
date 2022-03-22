// https://leetcode.com/problems/count-elements-with-strictly-smaller-and-greater-elements/
class Solution {
    func countElements(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {return 0}
        let smallest = nums.min()!
        let largest = nums.max()!
        guard smallest != largest else {return 0}
        var smallestCnt = 0
        var largestCnt = 0
        nums.forEach { v in
            if v == smallest {
                smallestCnt += 1
            }
            if v == largest {
                largestCnt += 1
            }
        }
        return nums.count - smallestCnt - largestCnt
    }
}
