// https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones/
class Solution {
    func checkOnesSegment(_ s: String) -> Bool {
       guard let firstIndexOfOne = s.firstIndex(of: "1") else {
           return true
       }
       guard let lastIndexOfOne = s.lastIndex(of: "1"), lastIndexOfOne != firstIndexOfOne else {
           return true
       }
       var idx = s.index(after: firstIndexOfOne)
       while idx < lastIndexOfOne {
           guard s[idx] == "1" else {
               return false
           }
           idx = s.index(after: idx)
       }
        return true
    }
}

class Solution2 {
    func checkOnesSegment(_ s: String) -> Bool {
        return !s.contains("01")
    }
}


