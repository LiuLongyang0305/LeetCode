// https://leetcode.com/problems/best-poker-hand/
class Solution {
   func bestHand(_ ranks: [Int], _ suits: [Character]) -> String {
       if Set<Character>(suits).count == 1 {
           return "Flush"
       }
       var cnt = [Int:Int]()
       for rank in ranks {
           cnt[rank, default: 0] += 1
       }
       let t = cnt.values.max()!
       if t >= 3 {
           return "Three of a Kind"
       } else if t == 2{
           return "Pair"
       } else {
           return "High Card"
       }
   }
}