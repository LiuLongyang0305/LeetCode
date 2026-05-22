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


class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let chars1 = [Character](s1)
        let chars2 = [Character](s2)
        let M = chars1.count
        var memo = [[[Bool?]]](repeating: [[Bool?]](repeating: [Bool?](repeating: nil, count: M + 5), count: M + 5), count: M + 5)
        func dfs(_ i: Int, _ j: Int, _ len: Int) -> Bool {
            guard len > 1 else {
                return chars1[i] == chars2[j]
            }

            if let sb = memo[i][j][len] {return sb}
            var sb =  false
            for curLen in 1..<len {
                sb = sb || (dfs(i,j , curLen) && dfs(i + curLen, j + curLen, len - curLen)) || (dfs(i, j + len - curLen, curLen) && dfs(i + curLen,j,len - curLen))
            }
            memo[i][j][len] = sb
            return sb
        }
        return dfs(0, 0, M)
    }
}
