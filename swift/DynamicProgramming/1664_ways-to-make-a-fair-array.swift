// https://leetcode.com/problems/ways-to-make-a-fair-array/
class Solution1 {
    func waysToMakeFair(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var cnt = 0
        var totalOdd = 0
        var totalEven = 0
        let N = nums.count
        for idx in 0..<N {
            if idx % 2 == 0 {
                totalEven += nums[idx]
            } else {
                totalOdd += nums[idx]
            }
        }
        var curOdd = 0
        var curEven = 0
        for idx in 0..<N {
            if idx % 2 == 0 {
                curEven += nums[idx]
            } else {
                curOdd += nums[idx]
            }
            if curEven + totalOdd - curOdd == curOdd + totalEven - curEven {
                cnt += 1
            }
        }
        return cnt
    }
}
class Solution {
    func waysToMakeFair(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var cnt = 0
        var totalOdd = 0
        var totalEven = 0
        let N = nums.count
        for idx in 0..<N {
            if idx % 2 == 0 {
                totalEven += nums[idx]
            } else {
                totalOdd += nums[idx]
            }
        }
        var curOdd = 0
        var curEven = 0
        for idx in 0..<N {

            let (p,q) = (curOdd,curEven)
            if idx % 2 == 0 {
                curEven += nums[idx]
            } else {
                curOdd += nums[idx]
            }
            if q + totalOdd - curOdd == p + totalEven - curEven {
                cnt += 1
            }
        }
        return cnt
    }
}