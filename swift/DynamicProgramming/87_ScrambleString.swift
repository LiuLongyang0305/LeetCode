// https://leetcode.com/problems/scramble-string/
 extension Sequence where Element == Character {
    var counter: [Character:Int] {
        var ans = [Character:Int]()
        self.forEach { ans.updateValue(( ans[$0] ?? 0) + 1, forKey: $0)}
        return ans
    }
 }
 class Solution {
    private struct State: Hashable {
        var left:Substring
        var right:Substring
    }
    private var memo = [State:Bool]()
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        memo = [:]
      return innerIsScramble( Substring(s1), Substring(s2))
    }
    private func  innerIsScramble(_ s1: Substring, _ s2: Substring) -> Bool {
        let key = State(left: s1, right: s2)
        guard nil == memo[key] else {
            return memo[key]!
        }
        guard s1 != s2 else {
            return true
        }
        guard s1.counter == s2.counter else {
            return false
        }
        let N = s1.count
        for length in 1..<N {
            if (innerIsScramble(s1.prefix(length), s2.prefix(length)) && innerIsScramble(s1.suffix(N - length), s2.suffix(N - length))) || (innerIsScramble(s1.prefix(length), s2.suffix(length)) && innerIsScramble(s1.suffix(N - length), s2.prefix(N - length))) {
                memo[key] = true
                return true
            }
        }
        memo[key] = false
        return false
    }
 }
