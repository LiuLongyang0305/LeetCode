//https://leetcode.com/problems/minimum-additions-to-make-valid-string/
class Solution {
    func addMinimum(_ word: String) -> Int {
        var ans = 0
        var temp = word
        while !temp.isEmpty {
            if temp.hasPrefix("abc") {
                temp.removeFirst(3)
                continue
            }
            if temp.hasPrefix("ab") || temp.hasPrefix("bc") || temp.hasPrefix("ac") {
                ans += 1
                temp.removeFirst(2)
                continue
            }
            ans += 2
            temp.removeFirst()
        }
        return ans
    }
}
