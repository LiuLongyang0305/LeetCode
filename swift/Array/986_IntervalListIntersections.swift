// https://leetcode.com/problems/interval-list-intersections/
 class Solution {
     typealias Interval = (start:Int,end:Int)
     func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
         let  AIntervals = A.sorted(by: { (val1, val2) -> Bool in
             val1[0] < val2[0]
         }).map { (val) -> Interval in
             (val[0],val[1])
         }
         let BIntervals = B.sorted(by: { (val1, val2) -> Bool in
             val1[0] < val2[0]
         }).map { (val) -> Interval in
             (val[0],val[1])
         }
         var ans = [[Int]]()
         for aInterval in AIntervals {
             for bInterval in BIntervals {
                 if bInterval.start > aInterval.end {
                     break
                 }
                 if bInterval.end < aInterval.start {
                     continue
                 }
                 ans.append([max(bInterval.start,aInterval.start),min(aInterval.end, bInterval.end)])
             }
         }
         return ans
     }
  }
