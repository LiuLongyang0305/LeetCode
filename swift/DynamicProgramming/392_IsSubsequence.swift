//https://leetcode.com/problems/is-subsequence/
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty {
            return true
        }
        if t.isEmpty {
            return false
        }
        var subArr = Array<Character>(s)
        var strArr = Array<Character>(t)
        let strSize = t.count
        var j = 0
        while j < strSize && !subArr.isEmpty  {
            while j < strSize && strArr[j] != subArr[0] {
                j += 1
            }
            if j < strSize {
                subArr.removeFirst()
            }
            j += 1
        }
        
        return subArr.isEmpty
    }
}
