// https://leetcode.com/problems/partition-array-such-that-maximum-difference-is-k/
class Solution {
    func partitionArray(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else {return nums.count}
        let sortedNums = nums.sorted()
        var cnt = 0

        var last: Int = -1000000000
        for num in sortedNums {
            if num - last > k {
                cnt += 1
                last = num
            }
        }
        return cnt
    }
}