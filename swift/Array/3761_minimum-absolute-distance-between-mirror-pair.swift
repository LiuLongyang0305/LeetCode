//https://leetcode.cn/problems/minimum-absolute-distance-between-mirror-pairs/
       class Solution {
           func minMirrorPairDistance(_ nums: [Int]) -> Int {
               var numToLastIdx = [Int:Int]()
               for i in 0..<nums.count {
                   numToLastIdx[nums[i]] = i
               }
               var sb = 1000000
               for i in 0..<nums.count {
                   if let idx = numToLastIdx[getReverseNumber(of: nums[i])], idx > i {
                       sb = min(sb,idx - i)
                   }
               }
               return sb == 1000000 ? -1 : sb
           }
           private func getReverseNumber(of num: Int) -> Int {
               return Int(String("\(num)".reversed())) ?? -1
           }
       }
