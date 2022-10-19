// https://leetcode.com/problems/valid-palindrome-iv/
class Solution {
    func makePalindrome(_ s: String) -> Bool {
        var leftIdx = s.startIndex
        var rightIdx = s.index(before: s.endIndex)
        var cnt = 0
        while leftIdx < rightIdx {
            if s[leftIdx] != s[rightIdx] {
                cnt += 1
            }
            leftIdx = s.index(after: leftIdx)
            rightIdx = s.index(before: rightIdx)
        }
        return cnt <= 2
    }
}