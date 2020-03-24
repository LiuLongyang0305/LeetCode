// https://leetcode.com/problems/longest-happy-prefix/
class Solution {
    func longestPrefix(_ s: String) -> String {
        guard s.count > 1 else {
            return ""
        }
        let N = s.count
        let chars = [Character](s)
        var next = Array<Int>(repeating: -1, count: N)
        var k = -1
        for index in 1..<N {
            while k != -1 && chars[k + 1] != chars[index] {
                k = next[k]
            }
            if chars[k + 1] == chars[index] {
                k += 1
            }
            next[index] = k
        }
        return next[N - 1] == -1 ? "" : String(chars[0...next[N - 1]])
    }
}

class Solution {
    private let base = 27
    private let start: UInt8 = 96
    private let MOD = 1_000_000_007
    func longestPrefix(_ s: String) -> String {
        guard s.count > 1 else {
            return ""
        }
        let N = s.count
        let chars = [Character](s)
        var hash = Array<Int>(repeating: 0, count: N)
        hash[0] = Int(chars[0].asciiValue! - start) % MOD
        for index in 1..<N {
            hash[index] = (hash[index - 1] * base + Int(chars[index].asciiValue! - start )) % MOD
        }
        var lastBase = 1
        var lastHash = 0
        var possibleLength = Set<Int>()
        for index in 0..<(N - 1) {
            lastHash += Int(chars[N - 1 - index].asciiValue! - start) * lastBase
            lastHash %= MOD
            lastBase = lastBase * base % MOD
            if lastHash == hash[index] {
                possibleLength.insert(index + 1)
            }
        }
        let sortedLength = possibleLength.sorted { $0 > $1}
        for l in sortedLength {
            if s.prefix(l) == s.suffix(l) {
                return String(s.prefix(l))
            }
        }
        return ""
    }
}
