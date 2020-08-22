// https://leetcode.com/problems/thousand-separator/
class Solution {
    func thousandSeparator(_ n: Int) -> String {
        let s = [Character]("\(n)".reversed())
        var ans = ""
        let N = s.count
        for i in 0..<N {
            ans.append(s[i])
            if i % 3 == 2 && i != N - 1{
                ans.append(".")
            }
        }
        return String(ans.reversed())
    }
}