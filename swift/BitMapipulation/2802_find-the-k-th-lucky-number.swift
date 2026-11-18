    // https://leetcode.cn/problems/find-the-k-th-lucky-number/
class Solution {
     func kthLuckyNumber(_ k: Int) -> String {
         var s = [Character](String(k + 1, radix: 2))
         s.removeFirst()

         return String(s.map { ch in
             if ch == "1" {
                 return Character("7")
             } else {
                 return Character("4")
             }
         })
     }
 }
