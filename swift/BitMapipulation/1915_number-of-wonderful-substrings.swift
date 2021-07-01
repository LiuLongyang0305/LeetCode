// https://leetcode.com/problems/number-of-wonderful-substrings/
class Solution {
    func wonderfulSubstrings(_ word: String) -> Int {
        var counter: [Int:Int] = [0:1]
        var ans = 0
        var mask = 0
        var idx = word.startIndex
        while idx < word.endIndex {
            mask ^= (1 << Int(word[idx].asciiValue! - 97))
            if let c = counter[mask] {
                ans += c
            }
            var i = 0
            while i < 10 {
                if let c = counter[mask ^ (1 << i)] {
                    ans += c
                }
                i += 1
            }
            counter[mask,default: 0] += 1
            idx = word.index(after: idx)
        }
        return ans
    }
}