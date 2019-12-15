// https://leetcode.com/problems/remove-covered-intervals/ 
class Solution {
     func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
         guard intervals.count > 1 else {
             return intervals.count
         }
         var sortedIntervals = intervals.sorted { (interval1, interval2) -> Bool in
             interval1[0] < interval2[0]
         }
         var i = 0
         while i < (sortedIntervals.count - 1) {
             var j = sortedIntervals.count - 1
             while j > i {
                 if sortedIntervals[j][0] >= sortedIntervals[i][0] && sortedIntervals[j][1] <= sortedIntervals[i][1] {
                     sortedIntervals.remove(at: j)
                 }
                 j -= 1
             }
             i += 1
         }
         return sortedIntervals.count
     }
  }