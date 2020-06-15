// https://leetcode.com/problems/running-sum-of-1d-array/
class Solution1 {
    func runningSum(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        var ans =  nums
        for i in 1..<nums.count {
            ans[i] += ans[i - 1]
        }
        return ans
    }
}
class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var sum = 0
        return nums.map { (num) -> Int in
            sum += num
            return sum
        }
    }
}