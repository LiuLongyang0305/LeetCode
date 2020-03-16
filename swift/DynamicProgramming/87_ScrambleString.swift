// https://leetcode.com/problems/scramble-string/
 extension Sequence where Element == Character {
    var counter: [Character:Int] {
        var ans = [Character:Int]()
        self.forEach { ans.updateValue(( ans[$0] ?? 0) + 1, forKey: $0)}
        return ans
    }
 }
 class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        return innerIsScramble( Substring(s1), Substring(s2))
    }
    private func  innerIsScramble(_ s1: Substring, _ s2: Substring) -> Bool {
        guard s1 != s2 else {
            return true
        }
        guard s1.counter == s2.counter else {
            return false
        }
        let N = s1.count
        for length in 1..<N {
            if (innerIsScramble(s1.prefix(length), s2.prefix(length)) && innerIsScramble(s1.suffix(N - length), s2.suffix(N - length))) || (innerIsScramble(s1.prefix(length), s2.suffix(length)) && innerIsScramble(s1.suffix(N - length), s2.prefix(N - length))) {
                return true
            }
        }
        return false
    }
 }
