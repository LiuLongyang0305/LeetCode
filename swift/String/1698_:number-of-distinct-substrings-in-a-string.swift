// https://leetcode.com/problems/number-of-distinct-substrings-in-a-string/
class Solution {
    func countDistinct(_ s: String) -> Int {
        var cnt = 0
        for length  in 1...s.count {
            var set = Set<String>()
            var left = s.startIndex
            var right = s.index(s.startIndex, offsetBy: length - 1)
            
            while right < s.endIndex {
                set.insert(String(s[left...right]))
                left = s.index(after: left)
                right = s.index(after: right)
            }
            cnt += set.count
        }
        return cnt
    }
}