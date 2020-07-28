// https://leetcode.com/problems/number-of-sub-arrays-with-odd-sum/
class Solution {
    func numOfSubarrays(_ arr: [Int]) -> Int {
        var ans = 0
        var odd = 0 // 奇数
        var even =  1 // 偶数
        var curSum = 0
        
        for num in  arr{
            curSum += num
            curSum %= 2
            if curSum == 1 {
                ans += even
                odd += 1
            }
            if curSum == 0 {
                ans += odd
                even += 1
            }
            ans %= 1_000_000_007
            
        }
        return ans
    }
}

