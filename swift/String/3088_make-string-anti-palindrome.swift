// https://leetcode.cn/problems/make-string-anti-palindrome/
class Solution {
    func makeAntiPalindrome(_ s: String) -> String {
        let N = s.count
        var counter = [Character:Int]()
        for ch in s {
            counter[ch,default: 0] += 1
        }
        var half = N / 2
        guard counter.values.max()! <= half else {return "-1"}

        var chars = [Character](s).sorted()


        var i = half - 1
        var j = half

        if chars[i] != chars[j] {
            return String(chars)
        }
        let target = chars[half]
        while i >= 0 && chars[i] == target {
            i -= 1
        }
        while j < N && chars[j] == target {
            j += 1
        }
        // print(chars)
        let c1 = half - (i + 1)
        let c2 = j - half
        let candidate = [Character](chars.suffix(half - c2))
        let newHalf = [Character](candidate.prefix(c1)) + [Character](repeating: target, count: c2) + [Character](candidate.suffix(half -  c2 - c1))
        chars.removeLast(half)
        chars += newHalf
        return String(chars)
    }
}
