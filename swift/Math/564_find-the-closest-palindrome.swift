// https://leetcode.com/problems/find-the-closest-palindrome/
class Solution {
    func nearestPalindromic(_ n: String) -> String {
        let N = n.count
        let ori = Int(n)!
        var lessThanOri = Int(pow(10.0, Double(N - 1))) - 1
        var greaterThanOri = Int(pow(10.0, Double(N))) + 1
        let leftPart = String(n.prefix((N + 1) / 2))
        let leftPartNumber = Int(leftPart)!
        for m in [leftPartNumber - 1, leftPartNumber,leftPartNumber + 1] {
            let l = "\(m)"
            var r = String(l.reversed())
            if N % 2 != 0 {
                r.removeFirst()
            }
            let cur = Int(l + r)!
            if cur < ori {
                lessThanOri = max(cur, lessThanOri)
            }
            if(cur > ori) {
                greaterThanOri = min(greaterThanOri,cur)
            }
        }
        guard ori - lessThanOri != greaterThanOri - ori else {
            return "\(lessThanOri)"
        }
        return ori - lessThanOri > greaterThanOri - ori ? "\(greaterThanOri)" : "\(lessThanOri)"
    }
}