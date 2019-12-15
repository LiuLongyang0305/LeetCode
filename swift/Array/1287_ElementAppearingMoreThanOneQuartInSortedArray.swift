//https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array/  
class Solution {
     func findSpecialInteger(_ arr: [Int]) -> Int {
         guard arr.count  > 3 else {
             return arr.first!
         }
         let targetLength = arr.count >> 2
         var lastIndex = 0
         for index in 1..<arr.count {
             if arr[index] != arr[lastIndex] {
                 if index - 1 -  lastIndex > targetLength  {
                     return arr[lastIndex]
                 }
                 lastIndex = index
             }
         }
         return arr.last!
     }
  }