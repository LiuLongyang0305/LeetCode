//https://leetcode.cn/problems/total-characters-in-string-after-transformations-i
extension Character {
    var numVal: Int {
        return Int(self.asciiValue! - 97)
    }
}
class Solution {
    private let MOD = 1_000_000_007
    let lowcaseCharToNextChar: [Character:Character] = ["q": "r", "t": "u", "x": "y", "z": "a", "w": "x", "l": "m", "h": "i", "v": "w", "c": "d", "p": "q", "a": "b", "e": "f", "b": "c", "y": "z", "k": "l", "g": "h", "n": "o", "d": "e", "r": "s", "s": "t", "j": "k", "m": "n", "u": "v", "f": "g", "o": "p", "i": "j"]
    func lengthAfterTransformations(_ s: String, _ t: Int) -> Int {
        var cnt = [Int](repeating: 0, count: 26)

        for ch in s {
            cnt[ch.numVal] += 1
        }
        for _ in 0..<t {
            var next = [Int](repeating: 0, count: 26)
            next[0] = cnt[25]
            next[1] = (cnt[0] + cnt[25]) % MOD
            for i in 2..<26{
                next[i] = cnt[i - 1]
            }
            cnt = next
        }

        return cnt.reduce(0) { ($0 + $1) % MOD}
    }
}