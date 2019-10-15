// https://leetcode.com/problems/count-binary-substrings/
class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        var ans = 0
        var groups = [Int]()
        groups.append(1)
        var index = s.index(after: s.startIndex)
        var last = s.startIndex
        while index < s.endIndex {
            if s[index] != s[last] {
                groups.append(1)
            } else {
                let  length = groups.count
                groups[length - 1] += 1
            }
            last = index
            index = s.index(after: last)
        }
        guard groups.count > 1 else {
            return 0
        }
        for i in 1..<groups.count {
            ans += min(groups[i], groups[i - 1])
        }
        return ans
    }
}

class Solution2 {
    func countBinarySubstrings(_ s: String) -> Int {
        var ans = 0
        var pre = 0
        var current = 1
        var index = s.index(after: s.startIndex)
        var last = s.startIndex
        while index < s.endIndex {
            if s[index] != s[last] {
                ans += min(pre, current)
                pre = current
                current = 1
            } else {
                current += 1
            }
            last = index
            index = s.index(after: last)
        }
        return ans + min(pre, current)
    }
}
Solution().countBinarySubstrings("00110")
