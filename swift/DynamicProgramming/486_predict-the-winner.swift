// https://leetcode.com/problems/predict-the-winner/
class Solution1 {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        func helper(_ left: Int, _ right: Int) -> Int {
            if left == right {
                return nums[left]
            }
            let pickStart = nums[left] - helper(left + 1, right)
            let pickEnd = nums[right] - helper(left, right - 1)
            return max(pickStart, pickEnd)
        }
        return helper(0, nums.count - 1) >= 0
    }
}
class Solution {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        var memo = [[Int]:Int]()
        
        func helper(_ left: Int, _ right: Int) -> Int {
            if let score = memo[[left,right]] {
                return score
            }
            if left == right {
                memo[[left,right]] = nums[left]
                return nums[left]
            }
            let pickStart = nums[left] - helper(left + 1, right)
            let pickEnd = nums[right] - helper(left, right - 1)
            memo[[left,right]] = max(pickStart, pickEnd)
            return memo[[left,right]]!
        }
        return helper(0, nums.count - 1) >= 0
    }
}

