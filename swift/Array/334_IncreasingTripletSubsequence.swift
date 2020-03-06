// https://leetcode.com/problems/increasing-triplet-subsequence/ 
class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        let N = nums.count
        guard N >= 3 else {
            return false
        }
        var small = Int.max
        var mid =  Int.max
        for num in nums {
            if num <= small {
                small = num
            } else if num <= mid {
                mid = num
            } else if num > mid {
                return true
            }
        }
        return false
    }
 }

