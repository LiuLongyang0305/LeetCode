// https://leetcode.com/problems/calculate-digit-sum-of-a-string/
class Solution {
    func digitSum(_ s: String, _ k: Int) -> String {
        guard s.count > k else {return s}
        var nextStr = ""
        var sCopy = s
        while !sCopy.isEmpty {
            let pre = String(sCopy.prefix(k))
            nextStr += caculate(pre)
            sCopy.removeFirst(pre.count)
        }
        return digitSum(nextStr, k)
    }


    private func caculate(_ s: String) -> String {
        var  ans = 0
        for ch in s {
            ans += Int(ch.asciiValue ?? 0) - 48
        }
        return "\(ans)"
    }
}