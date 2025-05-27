//https://leetcode.com/problems/find-if-array-can-be-sorted/
class Solution {

    func canSortArray(_ nums: [Int]) -> Bool {

        var new = [Int]()
        var i = 0
        let N = nums.count

        while i < N {
            let bitCnt = nums[i].nonzeroBitCount
            var j = i
            while j < N && nums[j].nonzeroBitCount == bitCnt {
                j += 1
            }
            new += nums[i..<j].sorted()
            i = j
        }

        return new == nums.sorted()
    }

}
