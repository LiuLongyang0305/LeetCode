//https://leetcode-cn.com/problems/maximum-average-subarray-i/
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        guard k > 1 else {
            return Double(nums.max()!)
        }
        var kElementsSum = 0
        var i = 0
        while i < k {
            kElementsSum += nums[i]
            i += 1
        }
        var maxAverage: Double = Double(kElementsSum) / Double(k)
        while i < nums.count {
            kElementsSum = kElementsSum + nums[i] - nums[i - k]
            let ave = Double(kElementsSum) / Double(k)
            if ave > maxAverage {
                maxAverage = ave
            }
            i += 1
        }
        return maxAverage
    }
}

class Solution2 {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        guard k > 1 else {
            return Double(nums.max()!)
        }
        var kElementsSum = 0
        var i = 0
        while i < k {
            kElementsSum += nums[i]
            i += 1
        }
        var maxAverage: Double = Double(kElementsSum) / Double(k)
        while i < nums.count {
            kElementsSum = kElementsSum + nums[i] - nums[i - k]
            if nums[i] > nums[i - k] {
                let ave = Double(kElementsSum) / Double(k)
                if ave > maxAverage {
                    maxAverage = ave
                }
            }
            i += 1
        }
        return maxAverage
    }
}

class Solution3 {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        guard k > 1 else {
            return Double(nums.max()!)
        }
        var kElementsSum = 0
        var i = 0
        while i < k {
            kElementsSum += nums[i]
            i += 1
        }
        var maxAverage: Double = Double(kElementsSum) / Double(k)
        var removeElementsSum = 0
        var addElmentsSum = 0
        while i < nums.count {
            removeElementsSum += nums[i - k]
            addElmentsSum += nums[i]
            if removeElementsSum < addElmentsSum {
                kElementsSum = kElementsSum - removeElementsSum + addElmentsSum
                removeElementsSum = 0
                addElmentsSum = 0
                let ave = Double(kElementsSum) / Double(k)
                if ave > maxAverage {
                    maxAverage = ave
                }
            }
            i += 1
        }
        return maxAverage
    }
}