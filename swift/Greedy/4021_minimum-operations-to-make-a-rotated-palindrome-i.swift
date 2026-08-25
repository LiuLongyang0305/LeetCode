// https://leetcode.cn/problems/minimum-operations-to-make-a-rotated-palindrome-i/
class Solution {
    func minOperations(_ s: String) -> Int {
        var chars = s.map {Int($0.asciiValue ?? 0) - 97}
        var s = minOperations(chars)
        for t in 1..<chars.count {
            chars.append(chars.removeFirst())
            s = min(s, t + minOperations(chars))
        }
        return s
    }
    private func minOperations(_ chars: [Int]) -> Int {

        var l = 0
        var r = chars.count - 1
        var sb = 0
        while l < r {
            let d = abs(chars[l] - chars[r])
            sb += min(d,26 - d)
            l += 1
            r -= 1
        }
        return sb
    }
}
