https://leetcode.com/problems/monotonic-array/
class Solution {
    var nums = [Int]()
    func isMonotonic(_ A: [Int]) -> Bool {
//        guard A.count > 2 else {
//            return true
//        }
        if A.count <= 2 {
            return true
        }
        self.nums = A
        return isMonnotoneDecreasing() || isMonnotoneIncreasing()
    }
    
    private func isMonnotoneIncreasing() -> Bool {
        for i in 1..<nums.count {
            if nums[i] < nums[i - 1] {
                return false
            }
        }
        return true
    }
    private func isMonnotoneDecreasing() -> Bool {
        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                return false
            }
        }
        return true
    }
}