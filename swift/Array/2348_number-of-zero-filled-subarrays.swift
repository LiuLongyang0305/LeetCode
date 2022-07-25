// https://leetcode.com/problems/number-of-zero-filled-subarrays/
class Solution {
   func zeroFilledSubarray(_ nums: [Int]) -> Int {
       var ans = 0
       var cnt = 0
       for num in nums {
           if num == 0 {
               cnt += 1
           } else if num != 0 {
               ans += cnt * (cnt + 1) / 2
               cnt = 0
           }
       }

       if cnt > 0 {
           ans += cnt * (cnt + 1) / 2
       }

       return ans
   }
}