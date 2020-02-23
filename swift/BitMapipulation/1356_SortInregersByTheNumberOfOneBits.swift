// https://leetcode.com/problems/sort-integers-by-the-number-of-1-bits/ 
class Solution {
    func sortByBits(_ arr: [Int]) -> [Int] {
        return arr.sorted { (v1, v2) -> Bool in
            if v1.nonzeroBitCount == v2.nonzeroBitCount {
                return v1 < v2
            }
            return v1.nonzeroBitCount < v2.nonzeroBitCount
        }
    }
 }