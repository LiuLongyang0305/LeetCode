// https://leetcode.com/problems/unique-length-3-palindromic-subsequences/
class Solution {
    private typealias IndexPair = (left: String.Index,right: String.Index)
    func countPalindromicSubsequence(_ s: String) -> Int {
        var ans = 0
        var map = [Character:IndexPair]()
        var idx = s.startIndex
        while idx < s.endIndex {
            if nil == map[s[idx]] {
                map[s[idx]] = (idx,idx)
            } else {
                map[s[idx]]?.right = idx
            }
            idx = s.index(after: idx)
        }
        for (_,indexPair) in map{
            guard indexPair.left != indexPair.right else {
                continue
            }
            var idx = s.index(after: indexPair.left)
            
            var differentChars = Set<Character>()
            while idx < indexPair.right {
                if !differentChars.contains(s[idx]) {
                    differentChars.insert(s[idx])
                }
                idx = s.index(after: idx)
            }
            ans += differentChars.count
        }
        return ans
    }
}
