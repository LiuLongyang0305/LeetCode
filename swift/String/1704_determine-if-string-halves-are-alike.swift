// https://leetcode.com/problems/determine-if-string-halves-are-alike/
class Solution {
    private let vowels = Set<Character>("aeiouAEIOU")
    func halvesAreAlike(_ s: String) -> Bool {
        var cnt = 0
        var l = s.startIndex
        var r = s.index(before: s.endIndex)
        while l < r {
            if vowels.contains(s[l]) {
                cnt += 1
            }
            if vowels.contains(s[r]) {
                cnt -= 1
            }
            l = s.index(after: l)
            r = s.index(before: r)
        }
        return cnt == 0
    }
}

