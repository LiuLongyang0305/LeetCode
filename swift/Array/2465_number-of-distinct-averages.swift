// https://leetcode.com/problems/number-of-distinct-averages/
class Solution {
    func distinctAverages(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        var set = Set<Int>()
        var i = 0
        var j = nums.count - 1
        while i < j {
            set.insert(sortedNums[i] + sortedNums[j])
            i += 1
            j -= 1
        }
        return set.count
    }
}