// https://leetcode.com/problems/maximum-repeating-substring/
class Solution {
    func maxRepeating(_ sequence: String, _ word: String) -> Int {
        let M = word.count
        let N = sequence.count
        guard M <= N else {
            return 0
        }
        guard M < N else {
            return word == sequence ? 1 : 0
        }
        var ans = 0
        var sequenceCopy = sequence
        let maxN = sequence.count / word.count
        let words = (0...maxN).map {$0 == 0 ? "" : String(repeating: word, count: $0)}
        //print(words)
        while !sequenceCopy.isEmpty {
            if sequenceCopy.hasPrefix(word) {
                var idx = 1
                while idx <= maxN && sequenceCopy.hasPrefix(words[idx]) {
                    idx += 1
                }
                ans = max(ans, idx - 1)
                sequenceCopy.removeFirst(M * (idx - 1))
            } else {
                sequenceCopy.removeFirst()
            }
        }
        return ans
    }
}