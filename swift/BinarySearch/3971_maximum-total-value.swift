//    https://leetcode.cn/problems/maximum-total-value/
   class Solution {
       let MOD = 1_000_000_007
       func maxTotalValue(_ value: [Int], _ decay: [Int], _ m: Int) -> Int {
           let n = value.count

           func countGreater(_ x: Int) -> Int {
               var cnt: Int = 0

               for i in 0..<n {
                   let v = value[i]
                   let d = decay[i]
                   if v <= x { continue }
                   cnt += (v - x - 1) / d + 1
               }
               return cnt
           }


           var l = 0
           var r = value.max()!

           while l < r {
               let mid = (l + r + 1) >> 1

               if countGreater(mid) >= m {
                   l = mid
               } else {
                   r = mid - 1
               }
           }



           let threshold = l

           var totalSum: Int = 0
           var cnt = 0
           for i in 0..<n {
               let v = value[i]
               let d = decay[i]

               if v <= threshold { continue }
               //计算v，v - d, v - 2d 直到大于therehold
               let k = (v - threshold - 1) / d
               totalSum += (k + 1)  * (v * 2 - k * d) / 2
               totalSum %= MOD
               cnt += k + 1
           }
           if cnt > m {
               let sub = (cnt  - m) * (threshold + 1) % MOD
               totalSum = (totalSum + MOD - sub) % MOD
           }
           return totalSum % MOD
       }
   }
