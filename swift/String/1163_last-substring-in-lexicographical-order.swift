// https://leetcode.com/problems/last-substring-in-lexicographical-order/
class Solution {
    func lastSubstring(_ s: String) -> String {
        let maxCh = s.max()!
        let minCh = s.min()!
        guard maxCh != minCh else {
            return s
        }
        var ans: Substring = s[...]
        var idx = s.startIndex
        while idx < s.endIndex {
            if s[idx] == maxCh {
                let subStr = s[idx...]
                if subStr > ans {
                    ans = subStr
                }
            }
            idx = s.index(after: idx)
        }
        return String(ans)
    }
}