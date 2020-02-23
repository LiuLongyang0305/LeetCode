// https://leetcode.com/problems/check-if-n-and-its-double-exist/ 
class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var set = Set<Int>()
        for ele in arr {
            if set.contains(ele << 1) {
                return true
            }
            if ele % 2 == 0 {
                if set.contains(ele >> 1) {
                    return true
                }
            }
            set.insert(ele)
        }
        return false
    }
 }


