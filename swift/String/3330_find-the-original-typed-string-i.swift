// https://leetcode.com/problems/find-the-original-typed-string-i/
class Solution {
    func possibleStringCount(_ word: String) -> Int {
        var ans = 1
        var last: Character = " "
        for ch in word {
            if ch == last {
                ans += 1
            }
            last = ch
        }
        return ans
    }
}