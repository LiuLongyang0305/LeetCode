//https://leetcode.cn/problems/maximum-gap-between-stations/
class Solution {
    func maximumGap(_ skill: String, _ station: String) -> Int {
        let s = [Character](skill)
        let t = [Character](station)
        let n = s.count
        var suf = [Int](repeating: -1, count: n)
        var j = t.count - 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            while t[j] != s[i] {
                j -= 1
            }
            suf[i] = j
            j -= 1
        }
        var sb = 0
        var pre = 0
        for i in 0..<(n - 1) {
            while t[pre] != s[i] {
                pre += 1
            }
            sb = max(sb,suf[i + 1] - pre)
            pre += 1
        }
        return sb
    }
}
