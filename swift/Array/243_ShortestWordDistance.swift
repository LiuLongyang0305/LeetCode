// https://leetcode.com/problems/shortest-word-distance/
class Solution {
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        let N = words.count
        var prefix = Array<Int>(repeating: -1, count: N)
        var suffix = Array<Int>(repeating: -1, count: N)
        for i in 0..<N {
            if words[i] == word1 {
                prefix[i] = i
            } else {
                if i != 0 {
                    prefix[i] = prefix[i - 1]
                }
            }
        }
        for i in (0..<N).reversed() {
            if words[i] == word1 {
                suffix[i] = i
            } else {
                if i != N - 1 {
                    suffix[i] = suffix[i + 1]
                }
            }
        }
        var ans = Int.max
        for i in 0..<N {
            if words[i] == word2 {
                if prefix[i] != -1 {
                    ans = min(ans, i - prefix[i])
                }
                if suffix[i] != -1 {
                    ans = min(ans, suffix[i] - i)
                }
            }
        }
        return ans
    }
}