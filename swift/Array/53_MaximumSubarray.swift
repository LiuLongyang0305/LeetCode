//https://leetcode.com/problems/maximum-subarray/
 Solution {
    
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.isEmpty ? 0 :  nums[0]
        }
        var arr = Array<Int>(repeating: 0, count: 2)
        arr[0] = nums[0]
        arr[1] = Int.min
        for j in 1..<nums.count {
            arr[1] = max(arr[0], arr[1])
            arr[0] = max(nums[j], arr[0] + nums[j])
        }
        return max(arr[0], arr[1])
    }
}