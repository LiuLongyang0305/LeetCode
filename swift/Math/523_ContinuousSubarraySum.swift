//https://leetcode.com/problems/continuous-subarray-sum/
class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var preSum = 0
        var  map = [Int:Int]()
        map[0] = -1
        for i in 0..<nums.count {
            preSum += nums[i]
            if k != 0 {
                preSum %= k
            }
            if let j = map[preSum] {
                if i -  j  > 1 {
                    return  true
                }
            } else {
                map[preSum] = i
            }
        }
        return false
    }
}